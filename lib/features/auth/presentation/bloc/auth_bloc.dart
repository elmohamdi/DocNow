import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/features/auth/domain/usecases/get_current_use_case.dart';
import 'package:i_clinic/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:i_clinic/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:i_clinic/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_event.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_state..dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  // final SendEmailVerificationUseCase sendEmailVerificationUseCase;

  AuthBloc({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
    // required this.sendEmailVerificationUseCase,
  }) : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    // on<SendEmailVerificationEvent>(_onSendEmailVerification);
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await signUpUseCase(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold((error) => emit(AuthError(message: error)), (user) {
      emit(AuthSuccess(user: user));
      // add(SendEmailVerificationEvent());
    });
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await signInUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold((error) => emit(AuthError(message: error)), (user) {
      emit(AuthSuccess(user: user));
      // if (!user.isEmailVerified) {
      //   emit(
      //     const AuthError(
      //       message: 'Please verify your email before signing in',
      //     ),
      //   );
      // } else {
      //   emit(AuthSuccess(user: user));
      // }
    });
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await signOutUseCase();

    result.fold(
      (error) => emit(AuthError(message: error)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await getCurrentUserUseCase();

    result.fold((error) => emit(AuthUnauthenticated()), (user) {
      if (user == null) {
        emit(AuthUnauthenticated());
      } else {
        emit(AuthSuccess(user: user));
      }
    });
  }
  // Future<void> _onSendEmailVerification(
  //   SendEmailVerificationEvent event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   final result = await sendEmailVerificationUseCase();

  //   result.fold(
  //     (error) => emit(AuthError(message: error)),
  //     (_) => emit(const EmailVerificationSent()),
  //   );
  // }
}
