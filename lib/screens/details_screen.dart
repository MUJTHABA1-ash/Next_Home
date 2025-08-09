import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final List<String> images;
  final int selectedIndex;
  const DetailsScreen({super.key, required this.images, required this.selectedIndex});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List Amenities = [
    "assets/wifi.png",
    "assets/gym.png",
    "assets/scooter.png"
  ];
  final List AmenitiesName = [
    'Wifi Services',
    'Gym',
    'Parking',
  ];
  final List Inclusions = [
    "assets/breakfast.png",
    "assets/lunch.png",
    "assets/dinner.png"
  ];
  final List InclusionsName = [
    'Breack Fast',
    'Lunch',
    'Dinner',
  ];
  final List flats = [
    "assets/flat.png",
    "assets/flat2.png",
    "assets/flat3.jpg"
  ];

  final List Rules = [
    "Respect others; noise levels low; cleanliness \nessential.",
    "Follow guest policy; no overnight guests.",
    "Curfew; no prohibited items.",
    "Stay in assigned rooms; property inspections.",
    "Follow meal times; clean kitchen after use.",
    "Participate in fire drills; know emergency \ncontacts."
  ];

  final List flat = ["assets/flat.png", "assets/flat2.png", "assets/flat3.jpg"];

  int index = 0;
  int currentIndex = 0;


  late int selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.selectedIndex;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: widget.images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Stack(
                children: [
                  // Background flat image
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    child: Image.asset(widget.images[selectedIndex], fit: BoxFit.fill),
                  ),

                  // Back arrow icon
                  Positioned(
                    top: 40.h,
                    left: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.white,
                        size: 40.sp,
                      ),
                    ),
                  ),

                  // Thumbnail ListView (you CANNOT wrap this directly in Positioned inside ListView)
                  Positioned(
                    top: 40.h,
                    right: 20.w,
                    child: SizedBox(
                      height: 190.h, // adjust height if needed
                      width: 60.w,
                      child: ListView.separated(
                        itemCount: flats.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = selectedIndex;
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage(flats[index]),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide(
                                    width: 2.w,
                                    color: selectedIndex == index
                                        ? Color(0xFF18A0DA)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5.h);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              options: CarouselOptions(
                initialPage: selectedIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = currentIndex;
                  });
                },
                height: 300.h,
                aspectRatio: 16 / 8,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                enlargeFactor: 0.4,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // Stack(
            //   children: [
            //     Container(
            //       width: 375.w,
            //       height: 300.h,
            //       color: Colors.white,
            //       child: Image.asset(
            //         widget.image,
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(left: 20.w, top: 40.h),
            //       child: GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).pop();
            //           },
            //           child: Icon(
            //             Icons.arrow_circle_left_outlined,
            //             color: Colors.white,
            //             size: 40.sp,
            //           )),
            //     ),
            //     SizedBox(
            //       height: 240.h,
            //       width: 350,
            //       child: Padding(
            //         padding:  EdgeInsets.only(top: 30.h),
            //         child: ListView.separated(
            //           itemCount: flats.length,
            //           scrollDirection: Axis.vertical,
            //           itemBuilder: (context, index) {
            //             return Positioned(
            //               right: 20.w,
            //               top: 90.h,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   Container(
            //                     width: 50.w,
            //                     height: 50.h,
            //                     decoration: ShapeDecoration(
            //                       image: DecorationImage(
            //                         image: AssetImage(flats[index]),
            //                         fit: BoxFit.cover,
            //                       ),
            //                       shape: RoundedRectangleBorder(
            //                         side: BorderSide(
            //                             width: 2.w, color: Colors.white),
            //                         borderRadius: BorderRadius.circular(8.r),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             );
            //           }, separatorBuilder: (BuildContext context, int index) {
            //             return SizedBox(height: 5.h,);
            //         },
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, top: 22.h),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Executive Stay PG',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 1.44.h,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFF737373),
                          ),
                          Text(
                            'Kottakkal, Kerala',
                            style: TextStyle(
                              color: const Color(0xFF737373),
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.57.h,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Text(
                        'Amenities',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 350.h,
                        child: ListView.separated(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 8.w),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w, color: Color(0xFF18A0DA)),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    Amenities[index],
                                    height: 16.h,
                                    width: 16.w,
                                    color: Color(0xFF18A0DA),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    AmenitiesName[index],
                                    style: TextStyle(
                                      color: const Color(0xFF18A0DA),
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.57.h,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 8.w,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views.....',
                              style: TextStyle(
                                color: const Color(0xFF737373),
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.57.h,
                              ),
                            ),
                            TextSpan(
                              text: 'Read More',
                              style: TextStyle(
                                color: const Color(0xFF18A0DA),
                                fontSize: 14.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.57.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Inclusions',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 350.h,
                        child: ListView.separated(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.h, vertical: 8.w),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w, color: Color(0xFF18A0DA)),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    Inclusions[index],
                                    height: 16.h,
                                    width: 16.w,
                                    color: Color(0xFF18A0DA),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    InclusionsName[index],
                                    style: TextStyle(
                                      color: const Color(0xFF18A0DA),
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.57.h,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 8.w,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                      Container(
                        width: 327.w,
                        height: 150.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              color: const Color(0xFFD9D9D9),
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/map.png",
                              width: 319.w,
                              height: 110.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blueAccent,
                                ),
                                Text(
                                  '9175 Chestnut StreetRome, NY 13440',
                                  style: TextStyle(
                                    color: const Color(0xFF737373),
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 1.57.h,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Rules & Restrictions',
                        style: TextStyle(
                          color: const Color(0xFF141414),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                      SizedBox(
                        height: 250.h,
                        width: 350.w,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: const Color(0xFFA7AEC1),
                                    size: 12.sp,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(Rules[index],
                                      style: TextStyle(
                                        color: const Color(0xFFA7AEC1),
                                        fontSize: 14.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 1.57.h,
                                      )),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 5.h,
                              );
                            },
                            itemCount: Rules.length),
                      ),
                Container(
                    width: 327.w,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF18A0DA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                  child:  Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 1.50.h,
                      ),
                    ),
                  ),
                ),
                      SizedBox(
                        height: 24.h,
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
