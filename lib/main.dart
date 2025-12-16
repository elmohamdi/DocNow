import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/app_router.dart';
import 'package:i_clinic/features/auth/presentation/auth_injection.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_state..dart';
import 'package:i_clinic/features/auth/presentation/screens/signin_screen.dart';
import 'package:i_clinic/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:i_clinic/features/onboarding/presentation/screens/onboarding1_screen.dart';
import 'package:i_clinic/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAuthDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(OnboardingRepositoryImpl()),
        ),

        BlocProvider(create: (context) => sl<AuthBloc>(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRouter,
        home: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            if (state is userIsNew) {
              return const Onboarding1Screen();
            }
            if (state is OnboardingInitial) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is userIsNotNew) {
              return const MainScreen();
            }
            return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial || state is AuthLoading) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is AuthUnauthenticated) {
                  return const SigninScreen();
                }
                if (state is AuthSuccess) {
                  return const MainScreen();
                }
                return const Scaffold(
                  body: Center(child: Text('Something went wrong')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
