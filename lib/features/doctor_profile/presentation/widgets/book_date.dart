import 'package:flutter/material.dart';
import 'package:i_clinic/core/const/app_color.dart';
import 'package:i_clinic/core/utils/helper.dart';

class BookDate extends StatelessWidget {
  BookDate({super.key, required this.day, required this.from, required this.to});

  String day;
  String from;
  String to;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.19,
      height: context.height * 0.13,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.0),
        border: BoxBorder.all(color: AppColor.lightGray),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: context.height * 0.02,
            decoration: BoxDecoration(
              color: AppColor.second,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.black, fontSize: 12.0),
            ),
          ),
          SizedBox(height: context.height * 0.015),
          Text(
            from,
            style: TextStyle(fontSize: 12, color: AppColor.darkGray),
          ),
          Text('to', style: TextStyle(fontSize: 12, color: AppColor.darkGray)),
          Text(
            to,
            style: TextStyle(fontSize: 12, color: AppColor.darkGray),
          ),
          SizedBox(height: context.height * 0.015),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: context.height * 0.02,
                decoration: BoxDecoration(
                  color: AppColor.main,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                ),
                child: Text(
                  'book',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.white, fontSize: 12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
