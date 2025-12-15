import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';
import 'package:i_clinic/features/doctor_profile/presentation/widgets/book_date.dart';
import 'package:i_clinic/features/doctor_profile/presentation/widgets/call_id.dart';
import 'package:i_clinic/features/doctor_profile/presentation/widgets/doctor_detail.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({super.key});

  final items = [
    BookDate(day: 'today', from: '02:00', to: '07:00'),
    BookDate(day: 'tomorrow', from: '05:00', to: '10:00'),
    BookDate(day: 'friday', from: '03:00', to: '06:00'),
    BookDate(day: 'saturday', from: '02:00', to: '07:00'),
    BookDate(day: 'monday', from: '05:00', to: '09:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.main, AppColor.white],
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 48.0),
                child: Row(
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
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.height * 0.06),
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
                        SizedBox(height: context.height * 0.03),
                        Text(
                          '400L.E / session',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                          ),
                        ),
                        SizedBox(height: context.height * 0.01),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Callid();
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.main,
                              shape: CircleBorder(),
                            ),
                            child: SvgPicture.asset('assets/icons/video.svg'),
                          ),
                        ),
                        SizedBox(height: context.height * 0.06),
                      ],
                    ),
                    Image.asset('assets/images/doctor.png'),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: context.height * 0.615,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'choose your booking date',
                        style: TextStyle(fontSize: 18, color: AppColor.main),
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    SizedBox(
                      height: context.height * 0.13,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return items[index];
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: context.width * 0.04),
                        itemCount: items.length,
                      ),
                    ),
                    SizedBox(height: context.height * 0.03),
                    Text(
                      "Doctor's Details",
                      style: TextStyle(color: AppColor.main, fontSize: 16),
                    ),
                    SizedBox(height: context.height * 0.02),
                    DoctorDetail(
                      iconUrl: 'assets/icons/speciality.svg',
                      detail: 'Speciality: Cardiology',
                    ),
                    SizedBox(height: context.height * 0.01),
                    DoctorDetail(
                      iconUrl: 'assets/icons/experience.svg',
                      detail: 'Experience: 12 years',
                    ),
                    SizedBox(height: context.height * 0.01),
                    DoctorDetail(
                      iconUrl: 'assets/icons/clinic.svg',
                      detail: 'Clinic: Cairo Heart Center',
                    ),
                    SizedBox(height: context.height * 0.01),
                    DoctorDetail(
                      iconUrl: 'assets/icons/address.svg',
                      detail: 'Address: Nasr City - Cairo',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
