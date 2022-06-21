part of 'models.dart';

class JadwalModel {
  final String id;
  final String img;
  final String hari;
  final String jam1;
  final String jam2;
  final String jam3;
  final String jam4;
  final String jam5;
  final String jadwal1;
  final String jadwal2;
  final String jadwal3;
  final String jadwal4;
  final String jadwal5;
  JadwalModel({
    required this.id,
    this.img = '',
    this.hari = '',
    this.jam1 = '',
    this.jam2 = '',
    this.jam3 = '',
    this.jam4 = '',
    this.jam5 = '',
    this.jadwal1 = '',
    this.jadwal2 = '',
    this.jadwal3 = '',
    this.jadwal4 = '',
    this.jadwal5 = '',
  });
  factory JadwalModel.fromJson(String id, Map<String, dynamic> json) =>
      JadwalModel(
        id: id,
        hari: json['hari'],
        img: json['img'],
        jam1: json['jam1'],
        jam2: json['jam2'],
        jam3: json['jam3'],
        jam4: json['jam4'],
        jam5: json['jam5'],
        jadwal1: json['jadwal1'],
        jadwal2: json['jadwal2'],
        jadwal3: json['jadwal3'],
        jadwal4: json['jadwal4'],
        jadwal5: json['jadwal5'],
      );
}
