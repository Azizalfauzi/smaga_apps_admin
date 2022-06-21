part of 'pages.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
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
            "Riwayat",
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
              color: const Color(0xff3D89F9),
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
                        "Ricky Sitompul",
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
                        "12345",
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
            "Tahun Ajaran",
            style: blackTextStyleInter.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: DropDown<String>(
              items: const ["2021/2022 Semester 1", "2021/2022 Semester 2"],
              hint: Text(
                "Pilih tahun ajaran",
                style: blackTextStyleInter.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              onChanged: (value) {},
              isExpanded: true,
              showUnderline: false,
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
            children: mockRiwayat
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  @override
  Widget build(BuildContext context) {
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
