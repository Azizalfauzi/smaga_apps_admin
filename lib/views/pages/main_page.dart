part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({Key? key, required this.initialPage}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                SafeArea(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedPage = index;
                      });
                    },
                    children: const [
                      Center(
                        child: HomePage(),
                      ),
                      Center(
                        child: ScanAbsenPage(),
                      ),
                      Center(
                        child: ProfilePage(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButtonNavigation(
                    selectedIndex: _selectedPage,
                    onTap: (index) {
                      setState(() {
                        _selectedPage = index;
                      });
                      _pageController.jumpToPage(_selectedPage);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const LoginPages();
          }
        },
      ),
    );
  }
}
