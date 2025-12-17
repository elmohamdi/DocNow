import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/core/utils/helper.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColor.main),
                    ),
                    fixedSize: Size(
                      context.width * 0.28,
                      context.height * 0.06,
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SvgPicture.asset('assets/images/logo2.svg'),
              ],
            ),

            SizedBox(height: context.height * 0.06),

            SvgPicture.asset('assets/images/onboarding3.svg'),

            SizedBox(height: context.height * 0.03),

            Text(
              'Welcome to DocNow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.main,
              ),
            ),

            SizedBox(height: context.height * 0.02),

            Text(
              'Book your medical appointments easily and   quickly.',
              style: TextStyle(fontSize: 16, color: AppColor.black),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: context.height * 0.08),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context, 
                      Routes.signup
                    );
                    context.read<OnboardingCubit>().notNew();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(
                      context.width * 0.43, 
                      context.height * 0.06
                    ),
                    backgroundColor: AppColor.main,
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context, 
                      Routes.signIn
                    );
                    context.read<OnboardingCubit>().notNew();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: AppColor.main),
                    ),
                    fixedSize: Size(
                      context.width * 0.43, 
                      context.height * 0.06
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
