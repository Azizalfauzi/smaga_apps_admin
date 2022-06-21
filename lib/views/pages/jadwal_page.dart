part of 'pages.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({Key? key}) : super(key: key);

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
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
          children: [
            const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Jadwal",
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
      height: 200,
      width: double.infinity,
      child: BlocBuilder<JadwalCubit, JadwalState>(
        builder: (context, state) {
          if (state is JadwalGetSuccess) {
            return GridView.count(
                crossAxisCount: 2,
                children: state.result
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ButtonJadwalWidget(
                          title: e.hari,
                          img: e.img,
                          onTap: () {
                            Navigator.pushNamed(context, '/jadwal-detail-page',
                                arguments: {
                                  "hari": e.hari,
                                  "img": e.img,
                                  "jam1": e.jam1,
                                  "jam2": e.jam2,
                                  "jam3": e.jam3,
                                  "jam4": e.jam4,
                                  "jam5": e.jam5,
                                  "jadwal1": e.jadwal1,
                                  "jadwal2": e.jadwal2,
                                  "jadwal3": e.jadwal3,
                                  "jadwal4": e.jadwal4,
                                  "jadwal5": e.jadwal5,
                                });
                          },
                        ),
                      ),
                    )
                    .toList());
          } else if (state is JadwalGetFailed) {
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
    // Column(
    //   children: [

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(top: 20),
    //       child: ButtonJadwalWidget(
    //         title: "Senin",
    //         img: "assets/images/ic_mon.png",
    //         onTap: () {
    //           Navigator.pushNamed(context, '/jadwal-detail-page',
    //               arguments: {
    //                 "id": 1,
    //                 "hari": "Senin",
    //                 "img": "assets/images/ic_mon.png"
    //               });
    //         },
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(top: 20),
    //       child: ButtonJadwalWidget(
    //         title: "Selasa",
    //         img: "assets/images/ic_tues.png",
    //         onTap: () {
    //           Navigator.pushNamed(context, '/jadwal-detail-page',
    //               arguments: {
    //                 "id": 2,
    //                 "hari": "Selasa",
    //                 "img": "assets/images/ic_tues.png"
    //               });
    //         },
    //       ),
    //     ),
    //   ],
    // ),
    //   ],
    // );
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
