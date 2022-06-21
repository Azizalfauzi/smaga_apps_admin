import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smaga_apps_admin_admin/models/models.dart';

import '../../services/services.dart';

part 'pengumuman_state.dart';

class PengumumanCubit extends Cubit<PengumumanState> {
  PengumumanCubit() : super(PengumumanInitial());
  void pengumumanFetch() async {
    try {
      emit(PengumumanLoading());

      List<PengumumanModel> result =
          await PengumumanServices().fetchPengumuman();

      emit(PengumumanGetSuccess(result));
    } catch (e) {
      emit(PengumumanGetFailed(e.toString()));
    }
  }
}
