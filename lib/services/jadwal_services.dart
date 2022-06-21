part  of 'services.dart';
class JadwalServices {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('jadwal');

  Future<List<JadwalModel>> fetchJadwal() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<JadwalModel> jadwal = result.docs.map(
        (e) {
          return JadwalModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return jadwal;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
