import 'package:flutter/material.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/features/Home/presentation/screens/home_screen.dart';
import 'package:i_clinic/features/profile/profile_screen.dart';
import 'package:i_clinic/features/transactions/transactions_screen.dart';
import 'package:liquid_navbar/liquid_navbar.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavScaffold(
        pages: [
          HomeScreen(),
          TransactionsScreen(),
          ProfileScreen()
          
        ],
        icons: [
          Icon(Icons.home),
          Icon(Icons.my_library_books),
          Icon(Icons.person),
          
        ],
        labels: [
          'Home',
          'Transactions',
          'Profile',
        ],

        navbarHeight: 70,
      indicatorWidth: 70,
      bottomPadding: 0,
      selectedColor: AppColor.main,
      unselectedColor: AppColor.darkGray,
      horizontalPadding: 16,
      ),
    );
  }
}