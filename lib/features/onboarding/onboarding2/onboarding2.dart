import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/next_button.dart';
import '../components/skip_button.dart';
import '../onboarding3/onboarding3.dart';
import 'second_container_clipper.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final PageController _pageController = PageController();
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updateCurrentPage);
  }

  void _updateCurrentPage() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentPage);
    _pageController.dispose();
    super.dispose();
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

  Widget _buildOnboardingContent(AppLocalizations local) {
    return Container(
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
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              local.realTimeUpdates,
              style: GoogleFonts.nunito(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff052A43),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              local.realTimeUpdatesDesc,
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xff052A43),
              ),
            ),
          ),
          SizedBox(height: 40.h),
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

  Widget _buildBottomContainer(AppLocalizations local) {
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
                  Color(0xff052A43),
                  Color(0xff0D6AA9),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 100.h,
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/onboarding/illustration 2.svg',
              width: 331.w,
              height: 300.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 20.w,
          right: 40.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkipButton(
                onPressed: () {
                  // TODO: Skip logic
                },
                text: local.skip,
              ),
              NextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Onboarding3(),
                    ),
                  );
                },
                text: local.next,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(flex: 1, child: _buildOnboardingContent(local)),
          Expanded(flex: 1, child: _buildBottomContainer(local)),
        ],
      ),
    );
  }
}
