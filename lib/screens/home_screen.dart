import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List state = ["C", "E", "T", "W", "I"];
  final List state1 = [
    'Calicut',
    'Ernakulam',
    'Thrissur',
    'Wayanad',
    'Idukki',
  ];
  final List flat = ["assets/flat.png", "assets/flat2.png", "assets/flat3.jpg"];
  final List flat2 = [
    "assets/flat3.jpg",
    "assets/flat.png",
    "assets/flat2.png"
  ];
  final List price = ["₹5000-₹12000", '₹5000', "10000"];
  final List category = ["Boys Hostel", "Girls Hostel"];
  final List img = ["assets/man.png","assets/girl.png"];
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  int currentIndex = 0;
@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF18A0DA),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r),bottomLeft: Radius.circular(12.r))


          ),
          child: AppBar(
            toolbarHeight: 80.h,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Builder(builder: (context) => GestureDetector(onTap: (){
                Scaffold.of(context).openDrawer();
              }, child: Image.asset("assets/menu.png",color: Colors.white,),),)
            ),
            // leading: Icon(
            //   Icons.menu,
            //   color: Colors.white,
            // ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello James,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.70.h,
                  ),
                ),
                Text(
                  "Let's Find The Hostel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundColor: Color(0xFFD9D9D9),
                            child: Icon(
                              Icons.person,
                              size: 40.sp,
                              color: Color(0xFF18A0DA),
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'Munas',
                                style: TextStyle(
                                  color: const Color(0xFF141414),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  height: 1.50,
                                ),
                              ),
                              Text(
                                '+91 9645013281',
                                style: TextStyle(
                                  color: const Color(0xFF737373),
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag_outlined),
                title: Text(
                  'My Bookings',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text(
                  'Need Help',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.output),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: const Color(0xFF141414),
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                    width: 330.w,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF4F6FA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(150.r),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                state[index],
                                style: TextStyle(
                                  color: const Color(0xFF18A0DA),
                                  fontSize: 20.sp,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                            ),
                            Text(
                              state1[index],
                              style: TextStyle(
                                color: const Color(0xFF141414),
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 15.w);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Quick picks for you',
                    style: TextStyle(
                      color: const Color(0xFF141414),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  SizedBox(
                    height: 55.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              currentIndex=index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(7),
                            width: 145.w,
                            height: 22.h,
                            decoration: BoxDecoration(color:Colors.white,
                            borderRadius:BorderRadius.circular(10.r),
                            border: currentIndex==index
                            ?Border.all(color: Colors.blueAccent,width: 1.w):Border.all(color: Colors.grey,width: 1.w)),
                            child: Center(child:Row(
                              children: [
                                SizedBox(height: 40.h,width: 40.w,child: Padding(
                                  padding: EdgeInsets.only(left: 14.w),
                                  child: Image.asset(img[index],color: currentIndex==index
                                      ? Colors.blue
                                      : Colors.grey),
                                )),
                                SizedBox(width: 8.w,),
                                Text(category[index],style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 1.57.h,
                                    color: currentIndex==index
                                        ? Colors.blue
                                        : Colors.grey
                                ),

                                ),
                              ],
                            ), ),
                          ),
                        );
                      },
                    ),
                  ),
              SizedBox(
                height: 10.h,
              ),
                  if(currentIndex==0)
              SizedBox(
                height: 357.h,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: flat.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                shadowColor: Colors.transparent,
                                child: Container(
                                  width: 327.w,
                                  height: 262.h,
                                  decoration: ShapeDecoration(
                                    color:   Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                  ),
                                  child: SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.r) ,
                                          child: Image.asset(
                                            flat[index],
                                            width: 327.w,
                                            height: 180.h,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Executive Stay PG',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF141414),
                                                fontSize: 14.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              price[index],
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF18A0DA),
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Kottakkal, Kerala',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w400,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              'per month',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.wifi,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Wifi Services',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.dumbbell,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Gym',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Icon(
                                              FontAwesomeIcons
                                                  .personBiking,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Parking',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                    FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  if(currentIndex==1)
                    SizedBox(
                      height: 357.h,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: flat2.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                shadowColor: Colors.transparent,
                                child: Container(
                                  width: 327.w,
                                  height: 262.h,
                                  decoration: ShapeDecoration(
                                    color:   Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8.r)),
                                  ),
                                  child: SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.r) ,
                                          child: Image.asset(
                                            flat2[index],
                                            width: 327.w,
                                            height: 180.h,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Executive Stay PG',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF141414),
                                                fontSize: 14.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              price[index],
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF18A0DA),
                                                fontSize: 16.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Kottakkal, Kerala',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              'per month',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.wifi,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Wifi Services',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.dumbbell,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Gym',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 18.w,
                                            ),
                                            Icon(
                                              FontAwesomeIcons
                                                  .personBiking,
                                              size: 15.sp,
                                              color: Color(0xFF737373),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Text(
                                              'Parking',
                                              style: TextStyle(
                                                color: const Color(
                                                    0xFF737373),
                                                fontSize: 12.sp,
                                                fontFamily: 'Inter',
                                                fontWeight:
                                                FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
