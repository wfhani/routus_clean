import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_project/features/onboarding/onboarding3/third_container_clipper.dart';
import '../../../components/custom_button.dart';
import '../../auth/presentation/screens/sign_in_screen.dart'; // Import the SignIn screen

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
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

  // Build dot indicator
  Widget _buildDot(int index, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 3.w), // Responsive margin
      width: isActive ? 29.w : 10.w, // Responsive width
      height: 10.h, // Responsive height
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFDC70A) : Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(12.r), // Responsive radius
      ),
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
            child: Stack(
              children: [
                ClipPath(
                  clipper: ThirdContainerClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
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
                Positioned(
                  top: 30.h, // Responsive top position
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/onboarding/illustration 3.png',
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
                  SizedBox(height: 0.h), // Space at the top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return _buildDot(index, index == 2 - _currentPage);
                    }),
                  ),
                  SizedBox(height: 62.h), // Space between dots and title
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0), // Responsive padding
                    child: Text(
                      "Your Child's\nDetails in One Place",
                      style: GoogleFonts.nunito(
                        fontSize: 28.sp, // Responsive font size
                        fontWeight: FontWeight.bold, // Bold
                        color: const Color(0xff052A43), // Navy blue color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25.h), // Space between title and description
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0), // Responsive padding
                    child: Text(
                      "View and update your child's profile, health, and transportation details with ease.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        fontSize: 16.sp, // Responsive font size
                        fontWeight: FontWeight.normal, // Regular
                        color: const Color(0xff052A43), // Navy blue color
                      ),
                    ),
                  ),
                  SizedBox(height: 62.h), // Space between description and button
                  CustomButton(
                    text: 'Get started',
                    onPressed: () {
                      // Navigate to the Sign In screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
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