part of 'pages.dart';

class SiswaPage extends StatefulWidget {
  const SiswaPage({Key? key}) : super(key: key);

  @override
  State<SiswaPage> createState() => _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {
  Widget header() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "XII MIPA 1",
              style: blackTextStyleInter.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 600,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: mockSiswa
                .map((e) => Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 5),
                      child: Card(
                        child: GestureDetector(
                          onTap: () {
                            if (e.id == 1) {
                              Navigator.pushNamed(
                                context,
                                '/detail-siswa-page',
                              );
                            } else {}
                          },
                          child: Container(
                            color: const Color(0xffBC219E),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nama :",
                                    textAlign: TextAlign.center,
                                    style: whiteTextStyleInter,
                                  ),
                                  Text(
                                    e.nama,
                                    textAlign: TextAlign.center,
                                    style: whiteTextStyleInter,
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nis",
                                    textAlign: TextAlign.center,
                                    style: whiteTextStyleInter,
                                  ),
                                  Text(
                                    e.nis,
                                    textAlign: TextAlign.center,
                                    style: whiteTextStyleInter,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
