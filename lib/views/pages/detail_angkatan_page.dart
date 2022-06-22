part of 'pages.dart';

class DetailAngkatanPage extends StatefulWidget {
  const DetailAngkatanPage({Key? key}) : super(key: key);

  @override
  State<DetailAngkatanPage> createState() => _DetailAngkatanPageState();
}

class _DetailAngkatanPageState extends State<DetailAngkatanPage> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
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
                "Angakatan" + arguments['angkatan'],
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
        height: 500,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            (arguments['id'] == 1)
                ? Column(
                    children: mockAngkatan2020
                        .map((e) => Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 5),
                              child: Card(
                                child: GestureDetector(
                                  onTap: () {
                                    if (e.id == 1) {
                                      Navigator.pushNamed(
                                        context,
                                        '/siswa-page',
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
                                            "Kelas",
                                            textAlign: TextAlign.center,
                                            style: whiteTextStyleInter,
                                          ),
                                          Text(
                                            e.kelas,
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
                                            "Jumlah",
                                            textAlign: TextAlign.center,
                                            style: whiteTextStyleInter,
                                          ),
                                          Text(
                                            e.jumlah,
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
                : (arguments['id'] == 2)
                    ? Column(
                        children: mockAngkatan2021
                            .map((e) => Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 5),
                                  child: Card(
                                    child: Container(
                                      color: const Color(0xffBC219E),
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kelas",
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                            Text(
                                              e.kelas,
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
                                              "Jumlah",
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                            Text(
                                              e.jumlah,
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )
                    : Column(
                        children: mockAngkatan2022
                            .map((e) => Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 5),
                                  child: Card(
                                    child: Container(
                                      color: const Color(0xffBC219E),
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Kelas",
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                            Text(
                                              e.kelas,
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
                                              "Jumlah",
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                            Text(
                                              e.jumlah,
                                              textAlign: TextAlign.center,
                                              style: whiteTextStyleInter,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
          ],
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
          ],
        ),
      ),
    );
  }
}
