import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_home/authentication/sign_in.dart';
import 'package:next_home/custom_container.dart';
import 'package:next_home/custom_textfield.dart';
import 'package:next_home/main.dart';
import 'package:next_home/screens/home_screen.dart';
import 'package:next_home/toast_Message.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> Myitems = ["Male", "Female"];
  String? selectedvalue;

  final auth = FirebaseAuth.instance;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController otp = TextEditingController();
  final formkey = GlobalKey<FormState>();

  final PinTheme defaultTheme = PinTheme(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      height: 50.h,
      width: 50.w);

  @override
  Widget build(BuildContext context) {
    void _showModelBottomSheet(BuildContext context, dynamic otpVerify) {
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
                                'A verification code will be sent to the phone +91 ${phone.text} for your account verification process.',
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
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     _textFieldOtp(first: true, last: false),
                              //     _textFieldOtp(first: false, last: false),
                              //     _textFieldOtp(first: false, last: false),
                              //     _textFieldOtp(first: false, last: false),
                              //     _textFieldOtp(first: false, last: false),
                              //     _textFieldOtp(first: false, last: true),
                              //   ],
                              // ),
                              Pinput(
                                controller: otp,
                                defaultPinTheme: defaultTheme,
                                length: 6,
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
                                    String OTP = otp.text.trim();
                                    if (OTP.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("Enter Otp")));
                                    } else {
                                      try {
                                        PhoneAuthCredential credential =
                                            PhoneAuthProvider.credential(
                                                verificationId: otpVerify,
                                                smsCode: OTP);
                                        FirebaseAuth.instance
                                            .signInWithCredential(credential)
                                            .then(
                                              (value) => {
                                                saveDataStorage(),
                                                ToastMessage().toastmessage(
                                                    message:
                                                        "Successfully Registered"),
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            HomeScreen(
                                                              name: name.text,
                                                              num: phone.text,
                                                            )))
                                              },
                                            );
                                      } on FirebaseAuthException catch (err) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text(err.code.toString())));
                                      }
                                    }
                                  },
                                  child: CustomContainer(
                                    width: 327.w,
                                    text: "Submit",
                                    fontSize: 14.sp,
                                  )),
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
        body: Form(
          key: formkey,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
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
                        CustomTextField(
                          labelText: "Enter Your Full Name",
                          fontSize: 14,
                          controller: name,
                          validator: (name) {
                            if (name!.isEmpty) {
                              return "Enter Your Full Name";
                            }
                            return null;
                          },
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
                        CustomTextField(
                          labelText: "Enter Phone Number",
                          fontSize: 14,
                          controller: phone,
                          validator: (value) {
                            if (value == null || value.length != 10) {
                              return 'Enter a valid 10-digit phone number';
                            }
                            return null;
                          },
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
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
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
                                color: Color(0xFFD9D9D9)),
                          ),
                          items: Myitems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(item),
                                  )
                                ],
                              ),
                            );
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
                          onTap: () async {
                            String number = phone.text.trim();
                            if (number.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Enter Phone Number")));
                            } else {}
                            try {
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                  verificationCompleted: (credential) {},
                                  verificationFailed: (credential) {},
                                  codeSent: (otp, token) {
                                    _showModelBottomSheet(context, otp);
                                  },
                                  codeAutoRetrievalTimeout: (otp) {},
                                  phoneNumber: "+91$number");
                            } on FirebaseAuthException catch (err) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Something Went Wrong")));
                            }
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            Text(
                              'I Already Have an Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF575757),
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => SignIn()));
                              },
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF18A0DA),
                                  fontSize: 14.sp,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void saveDataStorage() async {
    print(
      phone.text,
    );
    print(name.text);

    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool("isLoggedIn", true);
    await sharedPrefs.setString("name", name.text.trim());
    await sharedPrefs.setString("phone", phone.text.trim());
    await sharedPrefs.setBool("isLoggedIn", true);
  }
}
