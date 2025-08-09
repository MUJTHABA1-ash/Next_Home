import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:next_home/auth_service.dart';
import 'package:next_home/authentication/sign_up.dart';
import 'package:next_home/introduction_screen.dart';
import 'package:next_home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Future<void> isLogin (BuildContext context)async{
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final prefs = await SharedPreferences.getInstance();
    if(user!=null){
      final storedName = prefs.getString("name") ?? "Guest";
      final String num = user.phoneNumber ?? "";

      Timer(Duration(seconds:3), ()=>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen(name: storedName, num: num,))));
    }
    else{
      Timer(Duration(seconds:3), ()=>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>IntroductionPages())));
    }
  }
  void initState() {

    isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/splash.png",width: 176.w,
              height: 170.h,),
          )
        ],
      ),
    );
  }

}
