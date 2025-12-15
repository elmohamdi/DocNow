import 'package:equatable/equatable.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;
  final String? message;

  const AuthSuccess({required this.user, this.message});

  @override
  List<Object?> get props => [user, message];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}

class EmailVerificationSent extends AuthState {
  final String message;

  const EmailVerificationSent({
    this.message = 'Verification email sent! Please check your inbox.',
  });

  @override
  List<Object?> get props => [message];
}

class AuthUnauthenticated extends AuthState {}
