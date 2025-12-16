import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/features/onboarding/domain/onboarding_repository.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingRepository onboardingRepository;
  OnboardingCubit(this.onboardingRepository) : super(OnboardingInitial()) {
    isNew(); 
  }

  Future<void> isNew() async {
    try {
      final isNew = await onboardingRepository.isNew();
      if (isNew) {
        emit(userIsNew());
      } else {
        emit(userIsNotNew());
      }
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }

  Future<void> notNew() async {
    try {
      await onboardingRepository.notNew();
      emit(userIsNotNew());
    } catch (e) {
      emit(OnboardingError(e.toString()));
    }
  }
}
