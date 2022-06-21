part of 'widget.dart';

class ButtonHomeWidget extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;
  const ButtonHomeWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                color: kPrimaryColor,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: whiteTextStyleInter,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
