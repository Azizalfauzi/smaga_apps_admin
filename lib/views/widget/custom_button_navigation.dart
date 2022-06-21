part of 'widget.dart';

class CustomButtonNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomButtonNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20, left: 18, right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/ic_home' +
                                ((selectedIndex == 0)
                                    ? '_color.png'
                                    : '_nocolor.png'),
                          ),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Home',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 0))
                          ? kPrimaryColor
                          : kSecondaryGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // decoration: BoxDecoration(
                  //   color: ((selectedIndex == 0))
                  //       ? kBlueColor
                  //       : kSecondaryGreyColor,
                  //   borderRadius: BorderRadius.circular(defaultRadius),
                  // ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/ic_scan' +
                                ((selectedIndex == 1)
                                    ? '_color.png'
                                    : '_nocolor.png'),
                          ),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Absensi',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 1))
                          ? kPrimaryColor
                          : kSecondaryGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     onTap(2);
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //         width: 24,
          //         height: 24,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage(
          //                   'assets/images/ic_ceknoresi' +
          //                       ((selectedIndex == 2)
          //                           ? '_color.png'
          //                           : '_nocolor.png'),
          //                 ),
          //                 fit: BoxFit.contain)),
          //       ),
          //       Container(
          //         width: 50,
          //         child: Text(
          //           'Ongkir',
          //           style: whiteTextStyleInter.copyWith(
          //             fontSize: 10,
          //             color: ((selectedIndex == 2))
          //                 ? kBlueColor
          //                 : kSecondaryGreyColor,
          //           ),
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              onTap(2);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/ic_profile' +
                              ((selectedIndex == 2)
                                  ? '_color.png'
                                  : '_nocolor.png'),
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Profile',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 2))
                          ? kPrimaryColor
                          : kSecondaryGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
