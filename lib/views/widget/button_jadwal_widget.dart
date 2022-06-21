part of 'widget.dart';

class ButtonJadwalWidget extends StatelessWidget {
  final String title;
  final String img;
  final Function onTap;
  const ButtonJadwalWidget({
    Key? key,
    required this.title,
    required this.img,
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
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 20,
                ),
                child: Image.network(img),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  title,
                  style: whiteTextStyleInter.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
