import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_clinic/core/const/helper.dart';
import 'package:i_clinic/features/call/callPage.dart';


import '../../core/const/app_color.dart';

class Callid extends StatelessWidget {
  Callid({super.key});

  final TextEditingController callIDController = TextEditingController();

  void _startCall(BuildContext context) {
    final callID = callIDController.text.trim();
    if (callID.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a call ID')));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Callpage(callID: callID);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: context.height * 0.1)),
            SvgPicture.asset('assets/images/call_meeting.svg'),
            Padding(padding: EdgeInsets.only(top: context.height * 0.05)),
            SizedBox(
              width: context.width * 0.9,
              child: TextField(
                controller: callIDController,
                decoration: const InputDecoration(
                  fillColor: AppColor.second,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'Enter Room Code',
                  labelStyle: TextStyle(color: AppColor.black),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: context.height * 0.03)),
            ElevatedButton(
              onPressed: () => _startCall(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.main,
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.15,
                  vertical: context.height * 0.015,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Join Call',
                style: TextStyle(fontSize: 18, color: AppColor.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
