import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/const/helper.dart';
import 'package:i_clinic/core/const/routes.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: context.height * 0.15)),
          Center(child: SvgPicture.asset('assets/images/DocNow_frame.svg')),
          Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
          Container(
            width: context.width,
            height: context.height * 0.702,
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
                      'Sign in',
                      style: TextStyle(
                        color: AppColor.main,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
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
                          'Sign in',
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
                  Padding(padding: EdgeInsets.only(top: context.height * 0.04)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColor.main),
                    ),
                    width: context.width * 0.9,
                    height: context.height * 0.055,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.31,
                            ),
                          ),
                          Text('Facebook', style: TextStyle(fontSize: 18)),
                          Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.256,
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.059,
                            child: SvgPicture.asset(
                              'assets/images/logos_facebook.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppColor.main),
                    ),
                    width: context.width * 0.9,
                    height: context.height * 0.055,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.33,
                            ),
                          ),
                          Text('Google', style: TextStyle(fontSize: 18)),
                          Padding(
                            padding: EdgeInsets.only(
                              left: context.width * 0.279,
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.059,
                            child: SvgPicture.asset(
                              'assets/images/material-icon-theme_google.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: context.width * 0.24),
                        ),
                        Text(
                          'Don\'t Have an Account?',
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signup);
                          },
                          child: Text(
                            'Sign up',
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
