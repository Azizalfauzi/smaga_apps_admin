part of 'absensi_cubit.dart';

abstract class AbsensiState extends Equatable {
  const AbsensiState();

  @override
  List<Object> get props => [];
}

class AbsensiInitial extends AbsensiState {}

class AbsensiLoading extends AbsensiState {}

class AbsensiCreateSuccess extends AbsensiState {
  final List<AbsensiModel> result;
  const AbsensiCreateSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class AbsensiCreateFailed extends AbsensiState {
  final String message;
  const AbsensiCreateFailed(this.message);
  @override
  List<Object> get props => [message];
}
