part of 'pages.dart';

class DetailPengumumanPage extends StatelessWidget {
  const DetailPengumumanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Widget header() {
      return SizedBox(
        height: 300,
        width: double.infinity,
        child: Image.network(
          arguments["img"],
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              arguments["title"],
              style: TextStyle(
                fontWeight: bold,
                fontSize: 24,
              ),
            ),
            Text(
              arguments["subtitle"],
              style: TextStyle(
                fontWeight: light,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 18, right: 18),
          child: ButtonWidget(
            title: "Kembali",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            content(),
            footer(),
          ],
        ),
      ),
    );
  }
}
