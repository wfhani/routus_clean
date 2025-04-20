import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ✅ Added for SVG
import 'package:google_fonts/google_fonts.dart';

import '../components/dot_indicator.dart';
import '../components/next_button.dart';
import '../components/skip_button.dart';
import '../onboarding2/onboarding2.dart';
import 'first_container_clipper.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                ClipPath(
                  clipper: FirstContainerClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff052A43),
                          Color(0xff0D6AA9),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/onboarding/illustration 1.svg', // ✅ SVG path
                      width: 331.w,
                      height: 300.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h),
                  DotIndicator(
                    currentPage: _currentPage,
                    totalPages: 3,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Track your bus",
                      style: GoogleFonts.nunito(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff052A43),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "Easily locate your child's bus in real-time and ensure their safety on every journey.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff052A43),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.only(right: 23.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkipButton(
                          onPressed: () {
                            // TODO: Skip logic
                          },
                        ),
                        NextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Onboarding2(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
