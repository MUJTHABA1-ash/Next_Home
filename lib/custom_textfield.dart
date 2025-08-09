import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String labelText ;
  final double fontSize;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function (String?) validator;
  const CustomTextField({super.key, required this.labelText, required this.fontSize, required this.controller, required this.validator, this.keyboardType,});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller:controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: const Color(0xFFA1A1A1),
              fontSize: fontSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFD9D9D9))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r))),
        validator: validator,
      ),
    );
  }
}
