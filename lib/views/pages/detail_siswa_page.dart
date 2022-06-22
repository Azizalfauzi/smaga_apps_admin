part of 'pages.dart';

class DetailSiswaPage extends StatefulWidget {
  const DetailSiswaPage({Key? key}) : super(key: key);

  @override
  State<DetailSiswaPage> createState() => _DetailSiswaPageState();
}

class _DetailSiswaPageState extends State<DetailSiswaPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 18,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Detail Siswa",
              style: blackTextStyleInter.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget contentHeader() {
      return Padding(
        padding: const EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffBC219E),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nama",
                          style: whiteTextStyleInter,
                        ),
                        Text(
                          "Awan Seto",
                          style: whiteTextStyleInter.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nis",
                          style: whiteTextStyleInter,
                        ),
                        Text(
                          "2051",
                          style: whiteTextStyleInter.copyWith(
                              fontSize: 16, fontWeight: bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Mata Pelajaran",
              style: blackTextStyleInter.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget listDataRiwayat() {
      return SizedBox(
        height: 450,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: mockDetailSiswa
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.fromLTRB(
                          defaultMargin, 20, defaultMargin, 16),
                      child: Container(
                        color: Colors.grey.shade200,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                          header: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.mapel,
                                style: blackTextStyleInter.copyWith(
                                    fontWeight: bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                e.kelas,
                                style: blackTextStyleInter.copyWith(
                                    fontWeight: light),
                              ),
                            ],
                          ),
                          collapsed: const SizedBox(),
                          expanded: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jumlah pertemuan :",
                                    softWrap: false,
                                    style: blackTextStyleInter,
                                  ),
                                  Text(
                                    e.jumlahPertemuan.toString(),
                                    softWrap: false,
                                    style: blackTextStyleInter.copyWith(
                                        fontWeight: bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hadir :",
                                    softWrap: false,
                                    style: blackTextStyleInter,
                                  ),
                                  Text(
                                    e.hadir.toString(),
                                    softWrap: false,
                                    style: blackTextStyleInter.copyWith(
                                        fontWeight: bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tidak hadir :",
                                    softWrap: false,
                                    style: blackTextStyleInter,
                                  ),
                                  Text(
                                    e.tidakHadir.toString(),
                                    softWrap: false,
                                    style: blackTextStyleInter.copyWith(
                                        fontWeight: bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
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
            contentHeader(),
            listDataRiwayat(),
          ],
        ),
      ),
    );
  }
}
