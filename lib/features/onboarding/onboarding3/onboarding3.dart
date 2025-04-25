import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../components/custom_button.dart';
import '../../auth/presentation/screens/sign_in_screen.dart';
import 'third_container_clipper.dart';

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

  Widget _buildDot(int index, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: isActive ? 29.w : 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffFDC70A) : const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

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
                          Color(0xff052A43),
                          Color(0xff0D6AA9),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/onboarding/illustration 3.svg',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return _buildDot(index, index == 2 - _currentPage);
                    }),
                  ),
                  SizedBox(height: 62.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      local.childDetailsTitle,
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
                      local.childDetailsDesc,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff052A43),
                      ),
                    ),
                  ),
                  SizedBox(height: 62.h),
                  CustomButton(
                    text: local.getStarted,
                    onPressed: () {
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
