import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smaga_apps_admin_admin/models/models.dart';
import 'package:smaga_apps_admin_admin/services/services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoginLoding());
      UserModel user = await AuthServices().signIn(
        email: email,
        password: password,
      );
      emit(AuthLoginSuccess(user));
    } catch (e) {
      emit(AuthLoginFailed(e.toString()));
    }
  }

  void signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      emit(AuthLoginLoding());
      UserModel result = await AuthServices()
          .signUp(email: email, password: password, name: name);
      emit(AuthLoginSuccess(result));
    } catch (e) {
      emit(AuthLoginFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserServices().getUserById(id);
      emit(AuthLoginSuccess(user));
    } catch (e) {
      emit(AuthLoginFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoginLoding());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthLoginFailed(e.toString()));
    }
  }
}
