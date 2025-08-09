import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:next_home/authentication/sign_in.dart';
import 'package:next_home/authentication/sign_up.dart';

class IntroductionPages extends StatefulWidget {
  const IntroductionPages({super.key});

  @override
  State<IntroductionPages> createState() => _IntroductionPagesState();
}

class _IntroductionPagesState extends State<IntroductionPages> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignUp()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
      color: Color(0xFFA8A8A9),
      fontSize: 14.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0.sp, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.symmetric(),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: false,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16.h, right: 16.w),
          ),
        ),
      ),

      pages: [
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 250.h),
              child: Image(
                  image: AssetImage(
                "assets/intro1.png",
              )),
            ),
            titleWidget: Title(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/splash.png",
                      width: 88.w,
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 80.w, top: 10.h),
                      child: Text(
                        'Discover The Perfect \nStay At The Best Price',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 24.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )),
            bodyWidget: Column(
              children: [
                Center(
                  child: Text(
                    'Find the ideal PG at the right price. Affordable, comfortable, and perfectly suited to your needs.',
                    style: TextStyle(
                      color: const Color(0xFF737373),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.67.h,
                    ),
                  ),
                ),
              ],
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 16,
                imageFlex: 1,
                safeArea: 10)),
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 250.h),
              child: Image(
                  image: AssetImage(
                "assets/intro2.png",
              )),
            ),
            titleWidget: Title(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/splash.png",
                      width: 88.w,
                      height: 50.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 50.w, top: 10.h),
                        child: Text(
                          'Experience Pure Comfort \nand Pristine Cleanliness',
                          style: TextStyle(
                            color: const Color(0xFF141414),
                            fontSize: 24.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.33.h,
                          ),
                        )),
                  ],
                )),
            bodyWidget: Column(
              children: [
                Center(
                  child: Text(
                    'Experience unmatched comfort and cleanliness. Every corner is designed to offer you a refreshing stay.',
                    style: TextStyle(
                      color: const Color(0xFF737373),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.67,
                    ),
                  ),
                ),
              ],
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 16,
                imageFlex: 1,
                safeArea: 10)),
        PageViewModel(
            image: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 250.h),
              child: Image(
                  image: AssetImage(
                "assets/intro3.png",
              )),
            ),
            titleWidget: Title(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/splash.png",
                      width: 88.w,
                      height: 50.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 80.w, top: 10.h),
                        child: Text(
                          'Book Your Perfect PG. \nFast and Effortless.',
                          style: TextStyle(
                            color: const Color(0xFF141414),
                            fontSize: 24.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.33.h,
                          ),
                        )),
                  ],
                )),
            bodyWidget: Column(
              children: [
                Center(
                  child: Text(
                    'Easily book your perfect PG . Quick, convenient, and adjusted to fit your needs.',
                    style: TextStyle(
                      color: const Color(0xFF737373),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.67.h,
                    ),
                  ),
                ),
              ],
            ),
            decoration: PageDecoration(
                contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
                fullScreen: true,
                bodyFlex: 16,
                imageFlex: 1,
                safeArea: 10)),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left

      next: Padding(
        padding: EdgeInsets.only(right: 69.0.w, bottom: 20.h),
        child: Container(
          width: 150.w,
          height: 30.h,
          decoration: ShapeDecoration(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          child: Center(
            child: Text(
              'Next',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      done: Padding(
        padding: EdgeInsets.only(right: 69.w, bottom: 20.h),
        child: Container(
          width: 150.w,
          height: 30.h,
          decoration: ShapeDecoration(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r))),
          child: Center(
            child: Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        activeColor: Colors.transparent,
        size: Size(10.0, 10.0),
        color: Colors.transparent,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
        ),
      ),
    );
  }
}
