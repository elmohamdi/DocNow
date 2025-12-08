import 'package:flutter/material.dart';
import 'package:i_clinic/features/onboarding/presentation/onboarding1_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding1Screen(),
    );
  }
}
