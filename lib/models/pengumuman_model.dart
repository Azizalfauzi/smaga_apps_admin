part of 'models.dart';

class PengumumanModel {
  final String id;
  final String judul;
  final String deskripsi;
  final String img;
  PengumumanModel({
    required this.id,
    this.judul = '',
    this.deskripsi = '',
    this.img = '',
  });
  factory PengumumanModel.fromJson(String id, Map<String, dynamic> json) =>
      PengumumanModel(
        id: id,
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        img: json['img'],
      );
}
