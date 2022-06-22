part of 'models.dart';

class DummyAngkatan {
  int id;
  String kelas;
  String jumlah;
  DummyAngkatan(
    this.id,
    this.kelas,
    this.jumlah,
  );
}

List<DummyAngkatan> mockAngkatan2020 = [
  DummyAngkatan(1, "MIPA 1", "35"),
  DummyAngkatan(2, "MIPA 2", "40"),
  DummyAngkatan(3, "MIPA 3", "35"),
];
List<DummyAngkatan> mockAngkatan2021 = [
  DummyAngkatan(1, "MIPA 1", "35"),
  DummyAngkatan(2, "MIPA 2", "20"),
  DummyAngkatan(3, "MIPA 3", "35"),
];
List<DummyAngkatan> mockAngkatan2022 = [
  DummyAngkatan(1, "MIPA 1", "35"),
  DummyAngkatan(2, "MIPA 2", "30"),
  DummyAngkatan(3, "MIPA 3", "35"),
];
