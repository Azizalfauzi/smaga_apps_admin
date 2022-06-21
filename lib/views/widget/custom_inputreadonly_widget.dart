part of 'widget.dart';

class InputReadOnly extends StatelessWidget {
  final String label;
  final String input;
  const InputReadOnly({
    Key? key,
    required this.label,
    required this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: blackTextStyleInter.copyWith(
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: input,
              hintStyle: const TextStyle(
                color: kPrimaryColor,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
