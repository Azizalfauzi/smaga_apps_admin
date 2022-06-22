part of 'models.dart';

class DummySiswaRiwayat {
  final int id;
  final String mapel;
  final String kelas;
  final int jumlahPertemuan;
  final int hadir;
  final int tidakHadir;

  DummySiswaRiwayat(
    this.id,
    this.mapel,
    this.kelas,
    this.jumlahPertemuan,
    this.hadir,
    this.tidakHadir,
  );
}

List<DummySiswaRiwayat> mockDetailSiswa = [
  DummySiswaRiwayat(
    1,
    "Matematika",
    "XII Mipa 1",
    14,
    13,
    1,
  ),
  DummySiswaRiwayat(
    2,
    "Biologi",
    "XII Mipa 1",
    12,
    10,
    2,
  ),
  DummySiswaRiwayat(
    3,
    "Fisika",
    "XII Mipa 1",
    14,
    10,
    4,
  ),
];
