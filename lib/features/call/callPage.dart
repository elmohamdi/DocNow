import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_clinic/core/const/string.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Callpage extends StatelessWidget {
  final String callID;
  final String userID = Random().nextInt(1000000).toString();
  Callpage({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: appId,
      appSign: appSign,
      callID: callID,
      userID: userID,
      userName: "User $userID",
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
