import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/components/custom_nav_bar.dart';
import 'package:routus_clean/features/parent_home/presentation/cubit/home_cubit.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/home_action_button.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/tutorial_card.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/home_quick_actions.dart';
import 'package:routus_clean/features/weather/presentation/widgets/weather_section.dart'; // ✅ Added Weather Section

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    _HomeContent(),
    Container(color: Colors.green), // Contacts
    Container(color: Colors.blue), // My Bus
    Container(color: Colors.orange), // Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // **Top Gradient Background**
          Container(
            height: 260.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF052A43),
                  Color(0xFF0D6AA9),
                ],
              ),
            ),
          ),

          // **White Background Overlay**
          Positioned(
            top: 180.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
              ),
            ),
          ),

          SafeArea(
            top: true,
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),

                // **Header with Icons and Text**
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle settings action
                        },
                        child: SvgPicture.asset(
                          'assets/icons/settings.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle notifications
                        },
                        child: SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // **Welcome Text**
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Your child's journey starts here",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'Nunito',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                Expanded(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: _screens,
                  ),
                ),

                // **Custom Bottom Navigation**
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                  child: CustomNavBar(
                    currentIndex: selectedIndex,
                    onTabSelected: _onTabSelected,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ **Updated _HomeContent with Weather Section**
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items left
        children: [
          // **Tutorial Card**
          SizedBox(
            width: 330.w,
            child: const TutorialCard(),
          ),

          SizedBox(height: 20.h), // Keep spacing after tutorial card

          // **New Quick Actions Row**
          HomeQuickActions(),

          SizedBox(height: 10.h), // 🔹 Reduce space before WeatherSection

          // **Weather Section**
          const WeatherSection(), // ✅ Positioned right after quick actions

          SizedBox(height: 20.h), // Add some space before the next section

          // **Action Buttons Row**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/child_profile.svg',
                  label: "Child profile",
                ),
              ),
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/face_id.svg',
                  label: "Set face ID",
                ),
              ),
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/change_address.svg',
                  label: "Change address",
                ),
              ),
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/report_absent.svg',
                  label: "Report absent",
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h), // Space before the next section (if any)
        ],
      ),
    );
  }
}



















