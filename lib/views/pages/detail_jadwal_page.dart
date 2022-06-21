part of 'pages.dart';

class DetailJadwalPage extends StatefulWidget {
  const DetailJadwalPage({Key? key}) : super(key: key);

  @override
  State<DetailJadwalPage> createState() => _DetailJadwalPageState();
}

class _DetailJadwalPageState extends State<DetailJadwalPage> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 16,
              ),
              child: ButtonJadwalWidget(
                title: arguments['hari'],
                img: arguments['img'],
                onTap: () {},
              ),
            ),
          ),
          const Spacer(),
        ],
      );
    }

    Widget content() {
      return SizedBox(
        height: 500,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 5),
              child: Card(
                child: ListTile(
                  title: Text(
                    arguments['jam1'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    arguments['jadwal1'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 5),
              child: Card(
                child: ListTile(
                  title: Text(
                    arguments['jam2'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    arguments['jadwal2'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 5),
              child: Card(
                child: ListTile(
                  title: Text(
                    arguments['jam3'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    arguments['jadwal3'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 5),
              child: Card(
                child: ListTile(
                  title: Text(
                    arguments['jam4'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    arguments['jadwal4'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 5),
              child: Card(
                child: ListTile(
                  title: Text(
                    arguments['jam5'],
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    arguments['jadwal5'],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // (arguments['id'] == 1)
            //     ? Column(
            //         children: mockSenin
            //             .map((e) => Padding(
            //                   padding: const EdgeInsets.fromLTRB(
            //                       defaultMargin, 0, defaultMargin, 5),
            //                   child: Card(
            //                     child: ListTile(
            //                       title: Text(
            //                         e.jadwal,
            //                         textAlign: TextAlign.center,
            //                       ),
            //                       subtitle: Text(
            //                         e.jam,
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ),
            //                   ),
            //                 ))
            //             .toList(),
            //       )
            //       : (arguments['id'] == 2)
            //           ? Column(
            //               children: mockSelasa
            //                   .map((e) => Padding(
            //                         padding: const EdgeInsets.fromLTRB(
            //                             defaultMargin, 0, defaultMargin, 5),
            //                         child: Card(
            //                           child: ListTile(
            //                             title: Text(
            //                               e.jadwal,
            //                               textAlign: TextAlign.center,
            //                             ),
            //                             subtitle: Text(
            //                               e.jam,
            //                               textAlign: TextAlign.center,
            //                             ),
            //                           ),
            //                         ),
            //                       ))
            //                   .toList(),
            //             )
            //           : (arguments['id'] == 3)
            //               ? Column(
            //                   children: mockRabu
            //                       .map((e) => Padding(
            //                             padding: const EdgeInsets.fromLTRB(
            //                                 defaultMargin, 0, defaultMargin, 5),
            //                             child: Card(
            //                               child: ListTile(
            //                                 title: Text(
            //                                   e.jadwal,
            //                                   textAlign: TextAlign.center,
            //                                 ),
            //                                 subtitle: Text(
            //                                   e.jam,
            //                                   textAlign: TextAlign.center,
            //                                 ),
            //                               ),
            //                             ),
            //                           ))
            //                       .toList(),
            //                 )
            //               : (arguments['id'] == 4)
            //                   ? Column(
            //                       children: mockKamis
            //                           .map((e) => Padding(
            //                                 padding: const EdgeInsets.fromLTRB(
            //                                     defaultMargin,
            //                                     0,
            //                                     defaultMargin,
            //                                     5),
            //                                 child: Card(
            //                                   child: ListTile(
            //                                     title: Text(
            //                                       e.jadwal,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                     subtitle: Text(
            //                                       e.jam,
            //                                       textAlign: TextAlign.center,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ))
            //                           .toList(),
            //                     )
            //                   : (arguments['id'] == 5)
            //                       ? Column(
            //                           children: mockJumat
            //                               .map((e) => Padding(
            //                                     padding:
            //                                         const EdgeInsets.fromLTRB(
            //                                             defaultMargin,
            //                                             0,
            //                                             defaultMargin,
            //                                             5),
            //                                     child: Card(
            //                                       child: ListTile(
            //                                         title: Text(
            //                                           e.jadwal,
            //                                           textAlign: TextAlign.center,
            //                                         ),
            //                                         subtitle: Text(
            //                                           e.jam,
            //                                           textAlign: TextAlign.center,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ))
            //                               .toList(),
            //                         )
            //                       : Column(
            //                           children: mockSabtu
            //                               .map((e) => Padding(
            //                                     padding:
            //                                         const EdgeInsets.fromLTRB(
            //                                             defaultMargin,
            //                                             0,
            //                                             defaultMargin,
            //                                             5),
            //                                     child: Card(
            //                                       child: ListTile(
            //                                         title: Text(
            //                                           e.jadwal,
            //                                           textAlign: TextAlign.center,
            //                                         ),
            //                                         subtitle: Text(
            //                                           e.jam,
            //                                           textAlign: TextAlign.center,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ))
            //                               .toList(),
            //                         )
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
            title: "Selesai",
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
