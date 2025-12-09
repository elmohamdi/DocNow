import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/const/helper.dart';
import 'package:i_clinic/core/const/routes.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: context.height * 0.03)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColor.white),
              ),
            ],
          ),
          Center(child: SvgPicture.asset('assets/images/DocNow_frame.svg')),
          Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
          Container(
            width: context.width,
            height: context.height * 0.7695,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.02),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: AppColor.main,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.03),
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.width * 0.9,
                    height: context.height * 0.058,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hint: Text(
                          'Enter Your Name',
                          style: TextStyle(color: AppColor.gray, fontSize: 16),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: context.height * 0.01)),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.03),
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: context.height * 0.01)),
                  SizedBox(
                    width: context.width * 0.9,
                    child: PhoneFormField(
                      validator: PhoneValidator.valid(context),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.main),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: context.height * 0.03)),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      width: context.width * 0.9,
                      height: context.height * 0.055,
                      decoration: BoxDecoration(
                        color: AppColor.main,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.height * 0.035),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.06),
                        child: Container(
                          width: context.width * 0.4,
                          height: context.height * 0.001,
                          decoration: BoxDecoration(color: AppColor.gray),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.01),
                      ),
                      Text('or', style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.01),
                      ),
                      Container(
                        width: context.width * 0.4,
                        height: context.height * 0.001,
                        decoration: BoxDecoration(color: AppColor.gray),
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: context.width * 0.13,
                          height: context.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColor.main),
                          ),

                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/logos_facebook.svg',
                              width: context.width * 0.07,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.06),
                      ),
                      InkWell(
                        child: Container(
                          width: context.width * 0.13,
                          height: context.height * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColor.main),
                          ),

                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/material-icon-theme_google.svg',
                              width: context.width * 0.07,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width * 0.24),
                        ),
                        Text(
                          'Already Have an Account?',
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.signIn,
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.main,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
