part of 'pages.dart';

class DataAbsensiPage extends StatefulWidget {
  const DataAbsensiPage({Key? key}) : super(key: key);

  @override
  State<DataAbsensiPage> createState() => _DataAbsensiPageState();
}

class _DataAbsensiPageState extends State<DataAbsensiPage> {
  @override
  void initState() {
    context.read<JadwalCubit>().jadwalFetch();
    super.initState();
  }

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
              "Data Absensi",
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
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            children: mockAbsensi
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.fromLTRB(
                        defaultMargin, defaultMargin, defaultMargin, 16),
                    child: ButtonAbsensiWidget(
                      angkatan: e.angkatan,
                      kelas: e.kelas,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/angkatan-detail-page',
                          arguments: {
                            "id": e.id,
                            "angkatan": e.angkatan,
                          },
                        );
                      },
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
          content(),
        ],
      ),
    ));
  }
}
