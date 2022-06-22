part of 'pages.dart';

class PengumumanPage extends StatefulWidget {
  const PengumumanPage({Key? key}) : super(key: key);

  @override
  State<PengumumanPage> createState() => _PengumumanPageState();
}

class _PengumumanPageState extends State<PengumumanPage> {
  @override
  void initState() {
    context.read<PengumumanCubit>().pengumumanFetch();
    super.initState();
  }

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
          Padding(
            padding: const EdgeInsets.only(
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kPrimaryColor,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/tambah-pengumuman-page',
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Data Pengumuman",
            style: blackTextStyleInter.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget listDataPengumuman() {
    return BlocBuilder<PengumumanCubit, PengumumanState>(
      builder: (context, state) {
        if (state is PengumumanGetSuccess) {
          return SizedBox(
            height: 650,
            width: double.infinity,
            child: ListView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: state.result
                        .map(
                          (e) => GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  defaultMargin, 0, defaultMargin, 0),
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                    height: 50,
                                    width: 60,
                                    child: Image.network(e.img),
                                  ),
                                  title: Text(e.judul),
                                  subtitle: Text(e.deskripsi),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          );
        } else if (state is PengumumanGetFailed) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
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
            listDataPengumuman(),
          ],
        ),
      ),
    );
  }
}
