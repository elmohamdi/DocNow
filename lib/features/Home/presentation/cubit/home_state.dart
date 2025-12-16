part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeLoaded extends HomeState {
  final List<DoctorModel> doctors;

  HomeLoaded(this.doctors);
}
final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
