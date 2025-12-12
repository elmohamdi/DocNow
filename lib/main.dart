import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/features/Home/presentation/screens/home_screen.dart';
import 'package:i_clinic/features/doctor_profile/presentation/screens/doctor_profile_screen.dart';
import 'package:i_clinic/features/onboarding/data/onboarding_repository_impl.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:i_clinic/features/onboarding/presentation/screens/onboarding1_screen.dart';
import 'package:i_clinic/features/profile/profile_screen.dart';
import 'package:i_clinic/features/search/search_screen.dart';
import 'package:i_clinic/features/transactions/transactions_screen.dart';
import 'package:i_clinic/main_screen.dart';

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
          Routes.searchScreen: (context) => SearchScreen(),
          Routes.mainScreen: (context) => HomeScreen(),
          Routes.profileScreen: (context) => ProfileScreen(),
          Routes.transactionsScreen: (context) => TransactionsScreen(),
          Routes.doctorProfileScreen: (context) => DoctorProfileScreen(),

        },
        home: MainScreen(),
      ),
    ),
  );
}
