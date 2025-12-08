import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/features/onboarding/presentation/onboarding3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Column(
          children: [

            Row(
              children: [
                SvgPicture.asset('assets/images/logo2.svg'),               
              ],
            ),

            SizedBox(height: 32),

            SvgPicture.asset('assets/images/onboarding2.svg'),

            SizedBox(height: 32),

            Text(
              'Stay Organized',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.main
              )
            ),

            SizedBox(height: 16),

            Text(
              'Get automatic reminders so you never miss your appointment',
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

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboarding3Screen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(106, 48),
                    backgroundColor: AppColor.main
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),       
              ],
            )
          ],
        ),
      ),
    );
  }
}