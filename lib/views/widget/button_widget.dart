part of 'widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xffBC219E),
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 15,
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(title),
      ),
    );
  }
}
