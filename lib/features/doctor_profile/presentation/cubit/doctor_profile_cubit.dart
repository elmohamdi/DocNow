import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_clinic/features/doctor_profile/data/models/doctor_model.dart';
import 'package:i_clinic/features/doctor_profile/domain/doctor_profile_repository.dart';

part 'doctor_profile_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  DoctorProfileRepository repository;
  DoctorProfileCubit(this.repository) : super(DoctorProfileInitial());

  Future<void> gitInfo(String id) async {
    emit(DoctorProfileLoading());
    try {
      final doctor = await repository.getDoctorInfo(id);
      emit(DoctorProfileLoaded(doctor!));
    } catch (e) {
      emit(DoctorProfileError(e.toString()));
    }
  }

  
}
