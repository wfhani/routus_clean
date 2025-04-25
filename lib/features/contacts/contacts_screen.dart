import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/components/custom_nav_bar.dart';
import 'package:routus_clean/features/contacts/widgets/contacts_card.dart';
import 'package:routus_clean/features/contacts/widgets/child_selector_bottom_sheet.dart';
import 'package:routus_clean/features/contacts/widgets/feedback_bottom_sheet.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  int selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _showChildFilterSheet() {
    showChildSelectorBottomSheet(context);
  }

  void _showFeedbackSheet() {
    showFeedbackBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Container(
            height: 260.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
              ),
            ),
          ),

          /// White Rounded Overlay
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35.r)),
              ),
            ),
          ),

          /// Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                /// Header Icons (Settings & Notification)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/settings.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                /// Header Title & Subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your Support Team",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Get in touch with the team responsible for your child's journey",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                /// Filter Icon in white section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _showChildFilterSheet,
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 28.w,
                        height: 28.h,
                        // Original color preserved
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                /// Contact Cards
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    children: [
                      ContactsCard(
                        imagePath: 'assets/images/the_team/shahd.png',
                        name: "Shahd Mahmoud",
                        role: "Bus Supervisor",
                        onTap: _showFeedbackSheet,
                      ),
                      ContactsCard(
                        imagePath: 'assets/images/the_team/essam.png',
                        name: "Mohamed Essam",
                        role: "Driver",
                        onTap: _showFeedbackSheet,
                      ),
                      ContactsCard(
                        imagePath: 'assets/images/the_team/ghandour.png',
                        name: "Mohamed Taha",
                        role: "School Administrator",
                        onTap: _showFeedbackSheet,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.white,
        child: CustomNavBar(
          currentIndex: selectedIndex,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}
