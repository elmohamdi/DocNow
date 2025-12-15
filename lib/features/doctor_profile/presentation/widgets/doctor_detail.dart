import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';

class DoctorDetail extends StatelessWidget {
  DoctorDetail({super.key, required this.iconUrl, required this.detail});

  String iconUrl;
  String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.05,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.lightGray,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.04),
        child: Row(
          children: [
            SvgPicture.asset(iconUrl),
            SizedBox(width: context.width * 0.04),
            Text(
              detail,
              style: TextStyle(color: AppColor.darkGray, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
