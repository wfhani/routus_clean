import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:google_fonts/google_fonts.dart';
import '../components/dot_indicator.dart';
import '../components/next_button.dart';
import '../components/skip_button.dart'; // Import SkipButton
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
        _currentPage = _pageController.page!.round(); // Update the current page
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
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff052A43), // Gradient start color
                          Color(0xff0D6AA9), // Gradient end color
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/onboarding/illustration 1.png',
                      width: 331.w, // Responsive width
                      height: 300.h, // Responsive height
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
              padding: EdgeInsets.all(20.w), // Responsive padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r), // Responsive radius
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h), // Space at the top
                  DotIndicator(
                    currentPage: _currentPage,
                    totalPages: 3,
                  ),
                  SizedBox(height: 40.h), // Space between dots and title
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0), // Responsive padding
                    child: Text(
                      "Track your bus",
                      style: GoogleFonts.nunito(
                        fontSize: 28.sp, // Responsive font size
                        fontWeight: FontWeight.bold, // Bold
                        color: Color(0xff052A43), // Navy blue color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25.h), // Space between title and description
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0), // Responsive padding
                    child: Text(
                      "Easily locate your child's bus in real-time and ensure their safety on every journey.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        fontSize: 16.sp, // Responsive font size
                        fontWeight: FontWeight.normal, // Regular
                        color: Color(0xff052A43), // Navy blue color
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h), // Space between description and button
                  Padding(
                    padding: EdgeInsets.only(right: 23.w), // 23 pixels from the right
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkipButton(
                          onPressed: () {
                            // Add skip functionality here
                          },
                        ),
                        NextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Onboarding2(),
                              ),
                            ); // Navigate to Onboarding2
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