part of 'jadwal_cubit.dart';

abstract class JadwalState extends Equatable {
  const JadwalState();

  @override
  List<Object> get props => [];
}

class JadwalInitial extends JadwalState {}

class JadwalLoading extends JadwalState {}

class JadwalGetSuccess extends JadwalState {
  final List<JadwalModel> result;
  const JadwalGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class JadwalGetFailed extends JadwalState {
  final String message;
  const JadwalGetFailed(this.message);
  @override
  List<Object> get props => [message];
}
