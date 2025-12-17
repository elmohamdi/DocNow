import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_event.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_state..dart';
import 'package:i_clinic/features/auth/presentation/screens/signin_screen.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:i_clinic/features/onboarding/presentation/screens/onboarding1_screen.dart';
import 'package:i_clinic/main_screen.dart';

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStart> {
  @override
  void initState() {
    super.initState();
    context.read<OnboardingCubit>().isNew();
    context.read<AuthBloc>().add(CheckAuthStatusEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingInitial) {
          return const Scaffold(body: Center(child: Text('onboarding')));
        }

        if (state is userIsNew) {
          return const Onboarding1Screen();
        }

        if (state is userIsNotNew) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              if (authState is AuthInitial || authState is AuthLoading) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              if (authState is AuthUnauthenticated) {
                return const SigninScreen();
              }

              if (authState is AuthSuccess) {
                return const MainScreen();
              }

              return const Scaffold(
                body: Center(child: Text('Something went wrong')),
              );
            },
          );
        }

        return const Scaffold(body: Center(child: Text('Unexpected state')));
      },
    );
  }
}
