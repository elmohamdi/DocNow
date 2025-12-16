import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_clinic/features/Home/data/models/doctor_model.dart';
import 'package:i_clinic/features/Home/domain/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository repository;
  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> getDoctors() async {
    emit(HomeLoading());
    try {
      final doctors = await repository.getDoctors();
      emit(HomeLoaded(doctors));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
