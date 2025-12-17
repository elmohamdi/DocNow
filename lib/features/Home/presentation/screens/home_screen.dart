import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';
import 'package:i_clinic/core/widgets/message.dart';
import 'package:i_clinic/features/Home/presentation/cubit/home_cubit.dart';
import 'package:i_clinic/features/Home/presentation/widgets/top_doctor.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_event.dart';
import 'package:i_clinic/features/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          Message(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.04,
                vertical: context.height * 0.06,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset('assets/images/logo2.svg'),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AuthBloc>().add(SignOutEvent());
                        },
                        child: Icon(Icons.exit_to_app, color: AppColor.main),
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: context.height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColor.gray3,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.lightGray,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.03,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/search_icon.svg'),
                            SizedBox(width: context.width * 0.02),
                            Text(
                              'Dr.Ahmed Tarek',
                              style: TextStyle(
                                color: AppColor.darkGray,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: context.height * 0.03),

                  Container(
                    width: double.infinity,
                    height: context.height * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [AppColor.main, AppColor.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.01, 0.9],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.lightGray,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.04,
                        vertical: context.height * 0.02,
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '25% OFF',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.height * 0.01),
                              Text(
                                'invite a friend & book now ',
                                style: TextStyle(
                                  color: AppColor.darkGray,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'to claim your reward!',
                                style: TextStyle(
                                  color: AppColor.darkGray,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(width: context.width * 0.09),

                          SizedBox(
                            width: context.width * 0.25,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset('assets/images/adv1.png'),
                                ),

                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset('assets/images/adv2.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: context.height * 0.03),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: context.width * 0.43,
                        height: context.height * 0.16,
                        decoration: BoxDecoration(
                          color: AppColor.gray4,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.015,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/images/pana.svg'),
                              Text(
                                'video Consultation',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: context.width * 0.43,
                        height: context.height * 0.16,
                        decoration: BoxDecoration(
                          color: AppColor.gray4,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.01,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/images/rafiki.svg'),
                              Text(
                                'clinic inspection',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: context.height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Doctors',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.main,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'See all',
                          style: TextStyle(fontSize: 16, color: AppColor.main),
                        ),
                      ),
                    ],
                  ),
                  if (state is HomeLoaded)
                    GridView.builder(
                      padding: EdgeInsets.symmetric(
                        vertical: context.height * 0.01,
                      ),
                      itemCount: state.doctors.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: context.height * 0.01,
                        crossAxisSpacing: context.width * 0.03,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        final doctor = state.doctors[index];

                        return TopDoctor(
                          doctorId: doctor.id,
                          imageUrl: 'assets/images/doctor1.png',
                          name: doctor.name,
                          specialty: doctor.speciality,
                          price: doctor.price,
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
