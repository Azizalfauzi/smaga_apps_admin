part of 'services.dart';

class PengumumanServices {
  final CollectionReference _pengumumanReference =
      FirebaseFirestore.instance.collection('pengumuman');

  Future<List<PengumumanModel>> fetchPengumuman() async {
    try {
      QuerySnapshot result = await _pengumumanReference.get();

      List<PengumumanModel> destinations = result.docs.map(
        (e) {
          return PengumumanModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return destinations;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createPengumuman(PengumumanModel pengumuman) async {
    try {
      _pengumumanReference.add({
        'deskripsi': pengumuman.deskripsi,
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smaga-apps.appspot.com/o/ic_pengumuman_5.png?alt=media&token=ea3508b1-767d-437c-8ec2-26961c3bbfdd",
        'judul': pengumuman.judul,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
