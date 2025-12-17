import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            SizedBox(height: 100,),
            TextField(controller: callIDController),
            ElevatedButton(
              onPressed: () => _startCall(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.main,
              ),
              child: Text('Join to call'),
            ),
          ],
        ),
      ),
    );
  }
}
