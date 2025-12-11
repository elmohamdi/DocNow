import 'package:flutter/material.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/routes/routes.dart';
import 'package:i_clinic/core/utils/helper.dart';


class TopDoctor extends StatelessWidget {
  TopDoctor({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.price,
  });

  String imageUrl;
  String name;
  String specialty;
  int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.43,
      height: context.height * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.gray4,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02,
          vertical: context.height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: AppColor.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: context.height * 0.002),
            Text(
              specialty,
              style: TextStyle(fontSize: 16, color: AppColor.darkGray),
            ),
            SizedBox(height: context.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${price}L.E',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColor.darkGray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.doctorProfileScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fixedSize: Size(
                      context.width * 0.21,
                      context.height * 0.03,
                    ),
                    backgroundColor: AppColor.main,
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(fontSize: 16, color: AppColor.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
