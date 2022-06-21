part of 'models.dart';

class DummyRiwayat {
  final int id;
  final String mapel;
  final String kelas;
  final int jumlahPertemuan;
  final int hadir;
  final int tidakHadir;

  DummyRiwayat(
    this.id,
    this.mapel,
    this.kelas,
    this.jumlahPertemuan,
    this.hadir,
    this.tidakHadir,
  );
}

List<DummyRiwayat> mockRiwayat = [
  DummyRiwayat(
    1,
    "Matematika",
    "XII Mipa 1",
    14,
    13,
    1,
  ),
  DummyRiwayat(
    2,
    "Biologi",
    "XII Mipa 1",
    12,
    10,
    2,
  ),
  DummyRiwayat(
    3,
    "Fisika",
    "XII Mipa 1",
    14,
    10,
    4,
  ),
];
