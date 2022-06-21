part of 'services.dart';

class AbsensiServices {
  final CollectionReference _absensiReference =
      FirebaseFirestore.instance.collection('absensi');
  Future<void> createAbsensi(AbsensiModel absensi) async {
    try {
      _absensiReference.add({
        'jadwal': absensi.jadwal,
        'status': absensi.status,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
