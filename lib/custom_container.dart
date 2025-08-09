import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final height;
  final String text;
  final double fontSize;
  const CustomContainer({super.key, required this.width, this.height, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 40.h,
      padding: const EdgeInsets.symmetric(
          horizontal: 32, vertical: 14),
      decoration: ShapeDecoration(
        color: const Color(0xFF18A0DA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child:
        Center(
          child: Text(
          text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
    );
  }
}
