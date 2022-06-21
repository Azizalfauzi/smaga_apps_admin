part of 'pengumuman_cubit.dart';

abstract class PengumumanState extends Equatable {
  const PengumumanState();

  @override
  List<Object> get props => [];
}

class PengumumanInitial extends PengumumanState {}

class PengumumanLoading extends PengumumanState {}

class PengumumanGetSuccess extends PengumumanState {
  final List<PengumumanModel> result;
  const PengumumanGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class PengumumanGetFailed extends PengumumanState {
  final String message;
  const PengumumanGetFailed(this.message);
  @override
  List<Object> get props => [message];
}
