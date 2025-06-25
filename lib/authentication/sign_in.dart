import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_home/main.dart';
import 'package:next_home/screens/home_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  List<String> Myitems = ["Male", "Female"];
  String? selectedvalue;

  @override
  Widget build(BuildContext context) {
    void _showModelBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 400.h,
                  width: 380.w,
                  decoration: ShapeDecoration(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r)))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 300.h,
                        width: 380.w,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.r),
                                    topLeft: Radius.circular(20.r)))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(
                            children: [
                              Text(
                                'Phone Verification Sent!',
                                style: TextStyle(
                                    color: const Color(0xFF141414),
                                    fontSize: 18.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'A verification code will be sent to the Phone +91 \n9645013281 for your account verification process.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF737373),
                                  fontSize: 12.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              OtpTextField(
                                numberOfFields: 6,
                                borderColor: Color(0xFF512DA8),
                                //set to true to show as box or false to show as dash
                                showFieldAsBox: true,
                                //runs when a code is typed in
                                onCodeChanged: (String code) {
                                  //handle validation or checks here
                                },
                                //runs when every textfield is filled
                                onSubmit: (String verificationCode) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Verification Code"),
                                          content: Text(
                                              'Code entered is $verificationCode'),
                                        );
                                      });
                                }, // end onSubmit
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Haven't received the verification code? ",
                                      style: TextStyle(
                                        color: const Color(0xFF141414),
                                        fontSize: 12.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Resend it.',
                                      style: TextStyle(
                                        color: const Color(0xFF18A0DA),
                                        fontSize: 12.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 32.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                                },
                                child: Container(
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
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 70.h,
                    child: Image.asset(
                      "assets/otp.png",
                      height: 60.h,
                      width: 90.w,
                    )),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Image.asset(
                  "assets/splash.png",
                  width: 88.w,
                  height: 50.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Sign in to your\nAccount',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 24.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Please enter your details to access your account.',
                  style: TextStyle(
                    color: const Color(0xFF737373),
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'Full Name',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter your Full name',
                        labelStyle: TextStyle(
                          color: const Color(0xFFA1A1A1),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD9D9D9))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Enter Phone Number',
                        labelStyle: TextStyle(
                          color: const Color(0xFFA1A1A1),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD9D9D9))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Gender',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Text(
                          'Select Gender',
                          style: TextStyle(
                            color: const Color(0xFFA1A1A1),
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  buttonStyleData: ButtonStyleData(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFFD9D9D9)



                    ),

                  ),

                  items: Myitems.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(item),
                      )],
                    ),);
                  }).toList(),
                  value: selectedvalue,
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value;
                    });
                  },
                )),
                SizedBox(
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    _showModelBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF18A0DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.50.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
