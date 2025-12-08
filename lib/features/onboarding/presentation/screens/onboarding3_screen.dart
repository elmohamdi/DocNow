import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/Routes.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side : BorderSide(color: AppColor.main)
                    ),
                    fixedSize: Size(106, 48)
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                    ) 
                  ),

                SvgPicture.asset('assets/images/logo2.svg'),               
              ],
            ),

            SizedBox(height: 32),

            SvgPicture.asset('assets/images/onboarding3.svg'),

            SizedBox(height: 32),

            Text(
              'Welcome to DocNow',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.main
              )
            ),

            SizedBox(height: 16),

            Text(
              'Book your medical appointments easily and quickly.',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.black,  
              ),
              textAlign: TextAlign.center,
            ),


            SizedBox(height: 74),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(164, 48),
                    backgroundColor: AppColor.main
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ), 

                ElevatedButton(
                  onPressed: (){
                    
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side : BorderSide(color: AppColor.main)
                    ),
                    fixedSize: Size(164, 48)
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                    ) 
                  ),      
              ],
            ),

            SizedBox(height: 8),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.homeScreen);
                context.read<OnboardingCubit>().notNew();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue as',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.black,  
                    ),
                  ),
              
                  Text(
                    ' Guest',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.main,
                      fontWeight: FontWeight.bold,  
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}