part of 'doctor_profile_cubit.dart';

sealed class DoctorProfileState extends Equatable {
  const DoctorProfileState();

  @override
  List<Object> get props => [];
}

final class DoctorProfileInitial extends DoctorProfileState {}
final class DoctorProfileLoading extends DoctorProfileState {}
final class DoctorProfileLoaded extends DoctorProfileState {
  final DoctorModel doctor;

  DoctorProfileLoaded(this.doctor);
}
final class DoctorProfileError extends DoctorProfileState {
  final String message;
  DoctorProfileError(this.message);
}

