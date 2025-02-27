import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:google_fonts/google_fonts.dart';

import '../components/next_button.dart'; // Import NextButton
import '../components/skip_button.dart'; // Import SkipButton
import '../onboarding3/onboarding3.dart'; // Import Onboarding3
import 'second_container_clipper.dart'; // Import the separated clipper

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final PageController _pageController = PageController();
  int _currentPage = 1; // Starting page index

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      _currentPage = _pageController.page!.round(); // Update the current page
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage);
    _pageController.dispose();
    super.dispose();
  }

  // Build dot indicator
  Widget _buildDot(int index, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 3.w), // Responsive margin
      width: isActive ? 29.w : 10.w, // Responsive width
      height: 10.h, // Responsive height
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFDC70A) : const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(12.r), // Responsive radius
      ),
    );
  }

  // Build the onboarding content
  Widget _buildOnboardingContent() {
    return Container(
      padding: EdgeInsets.all(20.w), // Responsive padding
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50.h), // Reduced space at the top
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0), // Responsive padding
            child: Text(
              "Real-Time Updates\n",
              style: GoogleFonts.nunito(
                fontSize: 28.sp, // Reduced font size
                fontWeight: FontWeight.bold, // Bold
                color: const Color(0xff052A43), // Navy blue color
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0), // Responsive padding
            child: Text(
              "Receive alerts about delays, arrivals, and emergencies to stay updated at all times.\n",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                fontSize: 16.sp, // Reduced font size
                fontWeight: FontWeight.normal, // Regular
                color: const Color(0xff052A43), // Navy blue color
              ),
            ),
          ),
          SizedBox(height: 40.h), // Reduced space between text and dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return _buildDot(index, index == _currentPage);
            }),
          ),
        ],
      ),
    );
  }

  // Build the bottom gradient container with illustration and buttons
  Widget _buildBottomContainer() {
    return Stack(
      children: [
        ClipPath(
          clipper: SecondContainerClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff052A43), // Gradient start color
                  Color(0xff0D6AA9), // Gradient end color
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 100.h, // Responsive bottom position for the SVG
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/onboarding/illustration 2.png',
              width: 331.w, // Reduced width
              height: 300.h, // Reduced height
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 30.h, // 16 pixels of space at the bottom + 20 pixels for the buttons
          left: 20.w, // Responsive left position for the Skip button
          right: 40.w, // 40 pixels away from the right border
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
                      builder: (context) => const Onboarding3(),
                    ),
                  ); // Navigate to Onboarding3
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildOnboardingContent(),
          ),
          Expanded(
            flex: 1,
            child: _buildBottomContainer(),
          ),
        ],
      ),
    );
  }
}