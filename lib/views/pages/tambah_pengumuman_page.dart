part of 'pages.dart';

class TambahPengumumanPage extends StatefulWidget {
  const TambahPengumumanPage({Key? key}) : super(key: key);

  @override
  State<TambahPengumumanPage> createState() => _TambahPengumumanPageState();
}

class _TambahPengumumanPageState extends State<TambahPengumumanPage> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 18,
          top: 20,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tambah Pengumuman",
              style: blackTextStyleInter.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget formData() {
      return Padding(
        padding: const EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Judul ',
                  hintText: 'Masukan judul pengumuman'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Deskripsi ',
                  hintText: 'Masukan '),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Padding(
        padding: const EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 50,
        ),
        child: BlocConsumer<PengumumanCreateCubit, PengumumanCreateState>(
          listener: (context, state) {
            if (state is PengumumanCreateCreateSucess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Berhasil melakukan menambahkan pengumuman"),
                ),
              );
              Navigator.pushNamedAndRemoveUntil(
                  context, '/pengumuman-page', (route) => false);
            } else if (state is PengumumanCreateCreateFailed) {
              const SizedBox();
            } else {
              const SizedBox();
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffBC219E),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (_judulController.text == "" &&
                      _deskripsiController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Lakukan pengisian form dengan benar!'),
                      ),
                    );
                  } else {
                    final result = PengumumanModel(
                      id: '',
                      judul: _judulController.text,
                      deskripsi: _deskripsiController.text,
                      img: '',
                    );
                    context.read<PengumumanCreateCubit>().createPengumuman(result);
                  }
                },
                child: const Text(
                  "Tambah Pengumuman",
                ),
              ),
            );
          },
        ),
      );
      ;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            formData(),
            footer(),
          ],
        ),
      ),
    );
  }
}
