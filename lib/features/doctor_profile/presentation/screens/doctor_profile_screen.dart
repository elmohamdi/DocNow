import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';
import 'package:i_clinic/core/widgets/message.dart';
import 'package:i_clinic/features/doctor_profile/presentation/cubit/doctor_profile_cubit.dart';
import 'package:i_clinic/features/doctor_profile/presentation/widgets/book_date.dart';
import 'package:i_clinic/features/doctor_profile/presentation/screens/call_id.dart';
import 'package:i_clinic/features/doctor_profile/presentation/widgets/doctor_detail.dart';

// ignore: must_be_immutable
class DoctorProfileScreen extends StatefulWidget {
  DoctorProfileScreen({super.key, required this.doctorID});

  String doctorID;

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorProfileCubit>().gitInfo(widget.doctorID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorProfileCubit, DoctorProfileState>(
      listener: (context, state) {
        if (state is DoctorProfileError) {
          Message(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is DoctorProfileLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is DoctorProfileLoaded) {
          final dates = state.doctor.dates;
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
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 48.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset('assets/icons/back.svg'),
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
                                state.doctor.speciality,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.black,
                                ),
                              ),
                              SizedBox(height: context.height * 0.01),
                              Text(
                                'Dr.${state.doctor.name}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                ),
                              ),
                              // SizedBox(height: context.height * 0.01),
                              // Text(
                              //   'Tarek',
                              //   style: TextStyle(
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.bold,
                              //     color: AppColor.black,
                              //   ),
                              // ),
                              SizedBox(height: context.height * 0.03),
                              Text(
                                '${state.doctor.price}L.E / session',
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
                                  child: SvgPicture.asset(
                                    'assets/icons/video.svg',
                                  ),
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
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.main,
                              ),
                            ),
                          ),
                          SizedBox(height: context.height * 0.02),
                          SizedBox(
                            height: context.height * 0.13,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: dates.length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: context.width * 0.04),
                              itemBuilder: (context, index) {
                                final date = dates[index];

                                return BookDate(
                                  day: date.day,
                                  from: date.from,
                                  to: date.to,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: context.height * 0.03),
                          Text(
                            "Doctor's Details",
                            style: TextStyle(
                              color: AppColor.main,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: context.height * 0.02),
                          DoctorDetail(
                            iconUrl: 'assets/icons/speciality.svg',
                            detail: 'Speciality: ${state.doctor.speciality}',
                          ),
                          SizedBox(height: context.height * 0.01),
                          DoctorDetail(
                            iconUrl: 'assets/icons/experience.svg',
                            detail:
                                'Experience: ${state.doctor.experience} years',
                          ),
                          SizedBox(height: context.height * 0.01),
                          DoctorDetail(
                            iconUrl: 'assets/icons/clinic.svg',
                            detail: 'Clinic: ${state.doctor.clinic}',
                          ),
                          SizedBox(height: context.height * 0.01),
                          DoctorDetail(
                            iconUrl: 'assets/icons/address.svg',
                            detail: 'Address: ${state.doctor.address}',
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
        return Container();
      },
    );
  }
}
