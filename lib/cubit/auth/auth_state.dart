part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoginLoding extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final UserModel result;
  const AuthLoginSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class AuthLoginFailed extends AuthState {
  final String message;
  const AuthLoginFailed(this.message);
  @override
  List<Object> get props => [message];
}
