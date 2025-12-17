import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/app_start.dart';
import 'package:i_clinic/features/Home/data/home_repository_impl.dart';
import 'package:i_clinic/features/Home/presentation/cubit/home_cubit.dart';
import 'package:i_clinic/app_router.dart';
import 'package:i_clinic/features/auth/presentation/auth_injection.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/doctor_profile/data/doctor_profile_repository_impl.dart';
import 'package:i_clinic/features/doctor_profile/presentation/cubit/doctor_profile_cubit.dart';
import 'package:i_clinic/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';
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

        BlocProvider(
          create: (_) => HomeCubit(HomeRepositoryImpl())..getDoctors(),
        ),

        BlocProvider(
          create: (_) => DoctorProfileCubit(DoctorProfileRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRouter,
        home: AppStart(),
      ),
    );
  }
}
