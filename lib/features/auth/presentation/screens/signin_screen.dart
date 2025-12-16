import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/const/helper.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_event.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_state..dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.main,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Welcome back!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.only(top: context.height * 0.15)),
              Center(child: SvgPicture.asset('assets/images/DocNow_frame.svg')),
              Padding(padding: EdgeInsets.only(top: context.height * 0.02)),
              Expanded(
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
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
                          const SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.05,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: _emailController,
                                    // enabled: !isLoading,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      if (!RegExp(
                                        r'^[^@]+@[^@]+\.[^@]+',
                                      ).hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: 'Enter your Email',
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    controller: _passwordController,
                                    // enabled: !isLoading,
                                    obscureText: !_isPasswordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 6) {
                                        return 'Password must be at least 6 characters';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      hintText: 'Enter your Password',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  SignInEvent(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text,
                                  ),
                                );
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.homeScreen,
                                );
                              }
                            },
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

                          const SizedBox(height: 30),

                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: context.width * 0.06,
                                  ),
                                  child: Container(
                                    height: 1,
                                    color: AppColor.gray,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'or',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: context.width * 0.06,
                                  ),
                                  child: Container(
                                    height: 1,
                                    color: AppColor.gray,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Facebook',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 10),
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

                          const SizedBox(height: 15),

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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Google',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 10),
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

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have an Account?",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
