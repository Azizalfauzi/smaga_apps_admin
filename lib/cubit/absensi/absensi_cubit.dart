import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smaga_apps_admin_admin/models/models.dart';
import 'package:smaga_apps_admin_admin/services/services.dart';

part 'absensi_state.dart';

class AbsensiCubit extends Cubit<AbsensiState> {
  AbsensiCubit() : super(AbsensiInitial());
  void createAbsesnsi(AbsensiModel absensi) async {
    try {
      emit(AbsensiLoading());
      await AbsensiServices().createAbsensi(absensi);
      emit(const AbsensiCreateSuccess([]));
    } catch (e) {
      emit(AbsensiCreateFailed(e.toString()));
    }
  }
}
