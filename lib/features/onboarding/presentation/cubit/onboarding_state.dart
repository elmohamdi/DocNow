class OnboardingState {}
class OnboardingInitial extends OnboardingState {}
class userIsNew extends OnboardingState {}
class userIsNotNew extends OnboardingState {}
class OnboardingError extends OnboardingState {
  final String message;
  OnboardingError(this.message);
}