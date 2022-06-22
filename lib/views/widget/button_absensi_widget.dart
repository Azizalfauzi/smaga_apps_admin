part of 'widget.dart';

class ButtonAbsensiWidget extends StatelessWidget {
  final String angkatan;
  final String kelas;
  final Function onTap;
  const ButtonAbsensiWidget({
    Key? key,
    required this.angkatan,
    required this.kelas,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              color: const Color(0xffBC219E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultMargin, right: defaultMargin),
                      child: Text(
                        "Angkatan",
                        style: whiteTextStyleInter.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultMargin, right: defaultMargin),
                      child: Text(
                        angkatan,
                        style: whiteTextStyleInter.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultMargin, right: defaultMargin),
                      child: Text(
                        "Kelas",
                        style: whiteTextStyleInter.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: defaultMargin, right: defaultMargin),
                      child: Text(
                        kelas,
                        style: whiteTextStyleInter.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
