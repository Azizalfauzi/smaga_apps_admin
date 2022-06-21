part of 'models.dart';

class AbsensiModel extends Equatable {
  final String id;
  final String jadwal;
  final bool status;

  const AbsensiModel({
    this.id = '',
    this.jadwal = '',
    this.status = false,
  });

  factory AbsensiModel.fromJson(String id, Map<String, dynamic> json) =>
      AbsensiModel(
        id: id,
        jadwal: json['jadwal'],
        status: json['status'] as bool,
      );

  @override
  List<Object?> get props => [
        jadwal,
        status,
      ];
}
