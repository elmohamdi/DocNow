import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/features/Home/presentation/screens/home_screen.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_state..dart';
import 'package:i_clinic/features/profile/profile_screen.dart';
import 'package:i_clinic/features/transactions/transactions_screen.dart';
import 'package:liquid_navbar/liquid_navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacementNamed(context, Routes.signIn);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: BottomNavScaffold(
          pages: [HomeScreen(), TransactionsScreen(), ProfileScreen()],
          icons: [
            Icon(Icons.home),
            Icon(Icons.my_library_books),
            Icon(Icons.person),
          ],
          labels: ['Home', 'Transactions', 'Profile'],

          navbarHeight: 70,
          indicatorWidth: 70,
          bottomPadding: 0,
          selectedColor: AppColor.main,
          unselectedColor: AppColor.darkGray,
          horizontalPadding: 16,
        ),
      ),
    );
  }
}
