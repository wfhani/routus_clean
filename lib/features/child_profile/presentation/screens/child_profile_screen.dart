import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({super.key});

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  bool isProfileTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text("Child Profile"),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      height: 24.h,
                      width: 24.h,
                      color: Color(0xFFFDC70A),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Wrap in SizedBox to allow overflow
              SizedBox(
                height: 160.h, // A bit taller than image to allow overflow
                width: 150.h,
                child: Stack(
                  clipBehavior: Clip.none, // Allow overflow
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        'assets/images/default_profile.png',
                        height: 150.h,
                        width: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -5, // push out of bounds
                      right: -10,
                      child: Container(
                        height: 45.r,
                        width: 45.r,
                        decoration: BoxDecoration(
                          color: Color(0xFFFDC70A),
                          borderRadius: BorderRadius.circular(11.r),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),






              SizedBox(height: 20.h),

              // Tabs
              Container(
                width: 320.w,
                height: 46.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => isProfileTab = true),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 160.w,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: isProfileTab ? const Color(0xFFFDC70A) : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                            topRight: Radius.circular(isProfileTab ? 10.r : 0),
                            bottomRight: Radius.circular(isProfileTab ? 10.r : 0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Profile\nInformation",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            color: isProfileTab ? Colors.black : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => isProfileTab = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 160.w,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: !isProfileTab ? const Color(0xFFFDC70A) : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                            topLeft: Radius.circular(!isProfileTab ? 10.r : 0),
                            bottomLeft: Radius.circular(!isProfileTab ? 10.r : 0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Medical\nHistory",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            color: !isProfileTab ? Colors.black : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Pen Icon aligned right
              if (!isProfileTab)
                Padding(
                  padding: EdgeInsets.only(right: 24.w, top: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.edit_outlined, color: Color(0xFFFDC70A), size: 30),
                    ],
                  ),
                ),


              SizedBox(height: 30.h),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: isProfileTab ? _buildProfileInfo() : _buildMedicalHistory(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoColumn("Name", "Nermin Ahmed"),
        _infoColumn("Child ID", "242502"),
        _infoColumn("Bus ID", "543468"),
        _infoColumn("Grade", "3th"),
        _infoColumn("Gender", "Female"),
        _infoColumn("Date of birth", "17/2/2016"),
        _infoColumn("Address", "Nasr St, Cairo"),
      ],
    );
  }

  Widget _infoColumn(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 4.h),
          Text(value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
          Divider(color: Colors.white30, thickness: 0.7),
        ],
      ),
    );
  }

  Widget _buildMedicalHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _medicalSection("Chronic conditions and allergies", "Pollen Allergy: Experiences sneezing and watery eyes during spring"),
        _medicalSection("Immunization Records", "All required vaccines are up to date"),
        _medicalSection("Past hospitalizations", "Appendectomy (2022): Recovered fully, no complications."),
        _medicalSection("Emergency Info", "Preferred Hospital: City Health Center\nCurrent medications : None"),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _medicalSection(String title, String desc) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Colors.white38,
              )),
          SizedBox(height: 6.h),
          Text(desc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                height: 1.5,
              )),
          SizedBox(height: 12.h),
          Divider(color: Colors.white10, thickness: 0.8),
        ],
      ),
    );
  }
}
