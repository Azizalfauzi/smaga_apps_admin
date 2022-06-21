part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PengumumanCubit>().pengumumanFetch();
    super.initState();
  }

  Widget header() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoginSuccess) {
          return Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/ic_logo.png"),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Hallo ,Admin ${state.result.name}",
                          style: blueTextStyleInter.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            
                          ),
                        ),
                      ),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoginFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(state.message),
                            ),
                          );
                        } else if (state is AuthInitial) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login-page', (route) => false);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoginLoding) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            context.read<AuthCubit>().signOut();
                          },
                          child: const SizedBox(
                            height: 120,
                            width: 100,
                            child: Icon(Icons.settings),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget content() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              ButtonHomeWidget(
                image: "assets/images/ic_scan_home.png",
                title: "Buat Qr Code",
                onTap: () {},
              ),
              ButtonHomeWidget(
                image: "assets/images/ic_programmer_home.png",
                title: "Profile",
                onTap: () {},
              ),
            ],
          ),
          Row(
            children: [
              ButtonHomeWidget(
                image: "assets/images/ic_calendar_home.png",
                title: "Buat Absensi",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/jadwal-page',
                  );
                },
              ),
              ButtonHomeWidget(
                image: "assets/images/ic_book_home.png",
                title: "Pengumuman",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/riwayat-page',
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget listDataBerita() {
    return BlocBuilder<PengumumanCubit, PengumumanState>(
      builder: (context, state) {
        if (state is PengumumanGetSuccess) {
          return SizedBox(
            height: 450,
            width: double.infinity,
            child: ListView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: state.result
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/pengumuman-detail-page',
                                  arguments: {
                                    "title": e.judul,
                                    "subtitle": e.deskripsi,
                                    "img": e.img,
                                  });
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 0),
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 50,
                                    width: 60,
                                    child: Image.network(e.img),
                                  ),
                                  title: Text(e.judul),
                                  subtitle: Text(e.deskripsi),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          );
        } else if (state is PengumumanGetFailed) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            content(),
            //listDataBerita(),
          ],
        ),
      ),
    );
  }
}
