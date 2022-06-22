part of 'pengumuman_create_cubit.dart';

abstract class PengumumanCreateState extends Equatable {
  const PengumumanCreateState();
  @override
  List<Object> get props => [];
}

class PengumumanCreateInitial extends PengumumanCreateState {}

class PengumumanCreateLoading extends PengumumanCreateState {}

class PengumumanCreateCreateSucess extends PengumumanCreateState {
  final List<PengumumanModel> result;
  const PengumumanCreateCreateSucess(this.result);
  @override
  List<Object> get props => [result];
}

class PengumumanCreateCreateFailed extends PengumumanCreateState {
  final String message;
  const PengumumanCreateCreateFailed(this.message);
  @override
  List<Object> get props => [message];
}
