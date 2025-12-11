import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.main, AppColor.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 48.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/back.svg'),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icons/love.svg'),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.06),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cardiologist',
                        style: TextStyle(fontSize: 12, color: AppColor.black),
                      ),
                      SizedBox(height: context.height * 0.01),
                      Text(
                        'Dr. Ahmed',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: context.height * 0.01),
                      Text(
                        'Tarek',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: context.height * 0.04),
                      Text(
                        '400L.E / session',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: context.height * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.main,
                            shape: CircleBorder(),
                          ),
                          child: SvgPicture.asset('assets/icons/video.svg'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset('assets/images/doctor.svg')
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: context.height * 0.4,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
