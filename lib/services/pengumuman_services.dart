part of 'services.dart';

class PengumumanServices {
  final CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('pengumuman');

  Future<List<PengumumanModel>> fetchPengumuman() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

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
}
