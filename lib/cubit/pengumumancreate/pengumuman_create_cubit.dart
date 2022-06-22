import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smaga_apps_admin_admin/models/models.dart';
import 'package:smaga_apps_admin_admin/services/services.dart';

part 'pengumuman_create_state.dart';

class PengumumanCreateCubit extends Cubit<PengumumanCreateState> {
  PengumumanCreateCubit() : super(PengumumanCreateInitial());
  void createPengumuman(PengumumanModel pengumuman) async {
    try {
      emit(PengumumanCreateLoading());
      await PengumumanServices().createPengumuman(pengumuman);
      emit(const PengumumanCreateCreateSucess([]));
    } catch (e) {
      emit(PengumumanCreateCreateFailed(e.toString()));
    }
  }
}
