import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/parent_profile_model.dart';
import '../../data/repositories/parent_profile_repository.dart';
import '../widgets/logout_button.dart';
import '../widgets/profile_info_field.dart';

class ParentProfileScreen extends StatelessWidget {
  const ParentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ParentProfileRepository();

    return FutureBuilder<ParentProfileModel>(
      future: repo.fetchParentProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: Text("No profile data found")),
          );
        }

        final profile = snapshot.data!;

        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
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
              Positioned(
                top: 180.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35.r),
                    ),
                  ),
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/settings'),
                            child: SvgPicture.asset(
                              'assets/icons/settings.svg',
                              width: 28.w,
                              height: 28.h,
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/notifications'),
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
                    SizedBox(height: 25.h),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 120.w,
                          height: 120.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.r),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/default_profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFDC70A),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: const Icon(Icons.camera_alt, size: 20),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w, top: 20.h),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Add navigation to edit screen here
                          },
                          child: const Icon(Icons.edit, color: Color(0xFFFDC70A)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ListView(
                          children: [
                            const SizedBox(height: 10),
                            ProfileInfoField(label: 'First name', value: profile.firstName),
                            ProfileInfoField(label: 'Last name', value: profile.lastName),
                            ProfileInfoField(label: 'Email Address', value: profile.email),
                            ProfileInfoField(label: 'Phone Number', value: profile.phone),
                            ProfileInfoField(label: 'Gender', value: profile.gender),
                            ProfileInfoField(label: 'Date of birth', value: profile.birthDate),
                            const SizedBox(height: 15),
                            const LogoutButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
