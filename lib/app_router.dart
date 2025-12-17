import 'package:flutter/material.dart';
import 'package:i_clinic/features/Home/presentation/screens/home_screen.dart';
import 'package:i_clinic/features/auth/presentation/screens/signin_screen.dart';
import 'package:i_clinic/features/auth/presentation/screens/signup_screen.dart';
import 'package:i_clinic/features/doctor_profile/presentation/screens/doctor_profile_screen.dart';
import 'package:i_clinic/features/onboarding/presentation/screens/onboarding1_screen.dart';
import 'package:i_clinic/features/profile/profile_screen.dart';
import 'package:i_clinic/features/search/search_screen.dart';
import 'package:i_clinic/features/transactions/transactions_screen.dart';
import 'package:i_clinic/main_screen.dart';

class AppRouter {
  Route? generateRouter(RouteSettings setting) {
    switch (setting.name) {
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const Onboarding1Screen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/main_screen':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
        case '/transactions':
        return MaterialPageRoute(builder: (_) => const TransactionsScreen());
        case '/search':
        return MaterialPageRoute(builder: (_) =>  SearchScreen());
      default:
        return null;
    }
  }
}
