import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/features/Home/home_screen.dart';
import 'package:i_clinic/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_clinic/features/onboarding/presentation/screens/onboarding1_screen.dart';

void main() {
  runApp(
     MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit(OnboardingRepositoryImpl())),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        routes: {
          Routes.onboarding: (context) => Onboarding1Screen(),
          Routes.homeScreen: (context) => HomeScreen(),

        },
        home: Onboarding1Screen(),
      ),
    ),
  );
}
