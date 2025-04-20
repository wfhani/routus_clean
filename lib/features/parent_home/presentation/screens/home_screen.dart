import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:routus_clean/components/custom_nav_bar.dart';
import 'package:routus_clean/features/parent_home/presentation/cubit/home_cubit.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/home_action_button.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/tutorial_card.dart';
import 'package:routus_clean/features/parent_home/presentation/widgets/home_quick_actions.dart';
import 'package:routus_clean/features/weather/presentation/widgets/weather_section.dart';
import 'package:routus_clean/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:routus_clean/features/weather/data/weather_api_service.dart';
import 'package:routus_clean/features/weather/data/weather_ai_service.dart';
import 'package:routus_clean/features/parent_profile/presentation/screens/parent_profile_screen.dart';
import 'package:routus_clean/features/child_profile/presentation/screens/child_profile_screen.dart';
import 'package:routus_clean/features/contacts/contacts_screen.dart';




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
    BlocProvider(
      create: (_) => WeatherCubit(WeatherApiService(), WeatherAIService()),
      child: const _HomeContent(),
    ),
    Container(), // Contacts tab
    Container(), // My Bus tab
    const ParentProfileScreen(),
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
                SizedBox(height: 20.h),

                // ✅ Show Header + Welcome only on Home Tab
                if (selectedIndex == 0) ...[
                  // **Header with Icons and Text**
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/settings.svg',
                            width: 28.w,
                            height: 28.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/notifications');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/notification.svg',
                            width: 28.w,
                            height: 28.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

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

                  SizedBox(height: 50.h),
                ],

                // ✅ Main content
                Expanded(
                  child: IndexedStack(
                    index: selectedIndex,
                    children: _screens,
                  ),
                ),

                // **Custom Bottom Navigation**
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
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

// ✅ WeatherCubit is now injected above this widget
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 330.w,
            child: const TutorialCard(),
          ),
          SizedBox(height: 20.h),
          HomeQuickActions(),
          SizedBox(height: 10.h),
          const WeatherSection(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/child_profile.svg',
                  label: "Child profile",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChildProfileScreen()),
                    );
                  },
                ),
              ),

              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/face_id.svg',
                  label: "Set face ID",
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/change_address.svg',
                  label: "Change address",
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
              Expanded(
                child: HomeActionButton(
                  iconPath: 'assets/icons/report_absent.svg',
                  label: "Report absent",
                  onTap: () {
                    // Implement navigation or functionality here
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

