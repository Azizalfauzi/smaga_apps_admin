part of 'models.dart';

class AbsensiDummy {
  int id;
  String angkatan;
  String kelas;
  AbsensiDummy(
    this.id,
    this.angkatan,
    this.kelas,
  );
}

List<AbsensiDummy> mockAbsensi = [
  AbsensiDummy(
    1,
    "2020",
    "MIPA 1-6 & IPS 1-3 ",
  ),
  AbsensiDummy(
    2,
    "2021",
    "MIPA 1-5 & IPS 1-5 ",
  ),
  AbsensiDummy(
    3,
    "2022",
    "MIPA 1-6 & IPS 1-4 ",
  ),
];
