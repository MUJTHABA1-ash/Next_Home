import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_home/authentication/sign_up.dart';
import 'package:next_home/custom_container.dart';
import 'package:next_home/custom_textfield.dart';
import 'package:next_home/screens/home_screen.dart';
import 'package:next_home/toast_Message.dart';
import 'package:pinput/pinput.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phone = TextEditingController();
  FirebaseAuth Auth = FirebaseAuth.instance;
  final Formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  String verificationId = '';
  String smsCode = '';

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await Auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await Auth.signInWithCredential(credential);
        final UserCredential userCredential =
            await Auth.signInWithCredential(credential);
        final User? user = userCredential.user;
        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen(name: name.text , num: phone.text,)));
          ToastMessage().toastmessage(message: "Auto Login Successful");
        } else {
          ToastMessage().toastmessage(message: phoneNumber.toString());
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        ToastMessage()
            .toastmessage(message: e.message ?? "Verification failed");
      },
      codeSent: (String vId, int? resendToken) {
        verificationId = vId;
        _showModelBottomSheet(context);
      },
      codeAutoRetrievalTimeout: (String vId) {
        verificationId = vId;
      },
    );
  }

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
                    topLeft: Radius.circular(20.r),
                  ),
                ),
              ),
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
                          topLeft: Radius.circular(20.r),
                        ),
                      ),
                    ),
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
                          SizedBox(height: 8.h),
                          Text(
                            'A verification code was sent to +91 ${phone.text}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF737373),
                              fontSize: 12.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Pinput(
                            defaultPinTheme: PinTheme(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: const Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              height: 50.h,
                              width: 50.w,
                            ),
                            length: 6,
                            onCompleted: (value) {
                              smsCode = value;
                            },
                          ),
                          SizedBox(height: 32.h),
                          GestureDetector(
                            onTap: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId,
                                        smsCode: smsCode);
                                await Auth.signInWithCredential(credential);
                                ToastMessage().toastmessage(
                                    message: "Successfully Logged In");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen(name: name.text, num: phone.text)));
                              } catch (e) {
                                ToastMessage()
                                    .toastmessage(message: "Invalid OTP");
                              }
                            },
                            child: CustomContainer(
                              width: 327.w,
                              text: "Submit",
                              fontSize: 14.sp,
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
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: Formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
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
                  labelText: "Enter Your Phone Number",
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
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    print('test 1');
                    final isValid = Formkey.currentState?.validate();
                    if (isValid ?? false) {
                      print('test 2');
                      signInWithPhoneNumber(phone.text);
                    }
                    Formkey.currentState?.save();
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
                      'Create An Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF575757),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF73658),
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
          ),
        ),
      ),
    );
  }
}
