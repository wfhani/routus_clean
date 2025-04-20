import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/features/onboarding/onboarding1/onboarding1.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF052A43),
              Color(0xFF0D6AA9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              Text(
                'Choose your role',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Text(
                  'Select your role to personalize your experience',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 40.h),

              // 🔹 Scrollable Cards
              SizedBox(
                height: 480.h,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: [
                    _buildRoleCard(
                      context,
                      image: 'assets/images/parent.svg',
                      title: 'Parent',
                      color: const Color(0xFF699CFF),
                      isSelected: _currentPage == 0,
                    ),
                    _buildRoleCard(
                      context,
                      image: 'assets/images/supervisor.svg',
                      title: 'Bus\nsupervisor',
                      color: const Color(0xFF699CFF),
                      isSelected: _currentPage == 1,
                    ),
                    _buildRoleCard(
                      context,
                      image: 'assets/images/admin.svg',
                      title: 'School\nadministrator',
                      color: const Color(0xFF699CFF),
                      isSelected: _currentPage == 2,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Padding(
                padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 35.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Onboarding1(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Only Parent role is available right now"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFDC70A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: const Color(0xFF052A43),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Card Widget with Highlight if Selected
  Widget _buildRoleCard(
      BuildContext context, {
        required String image,
        required String title,
        required Color color,
        required bool isSelected,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 420.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40.r),
          border: isSelected
              ? Border.all(color: Colors.white, width: 3.w)
              : null,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 350.w,
              height: 350.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF052A43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








