import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/core/const/Routes.dart';
import 'package:i_clinic/features/Home/home_screen.dart';
import 'package:i_clinic/features/auth/presentation/auth_injection.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/screens/signin_screen.dart';
import 'package:i_clinic/features/auth/presentation/screens/signup_screen.dart';
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

        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.onboarding: (context) => const Onboarding1Screen(),
          Routes.homeScreen: (context) => const HomeScreen(),
          Routes.signup: (context) => const SignupScreen(),
          Routes.signIn: (context) => const SigninScreen(),
        },
        initialRoute: Routes.signIn,
      ),
    );
  }
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
