// lib/features/parent_profile/presentation/screens/parent_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/parent_profile_cubit.dart';
import '../widgets/profile_info_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParentProfileScreen extends StatefulWidget {
  const ParentProfileScreen({super.key});

  @override
  State<ParentProfileScreen> createState() => _ParentProfileScreenState();
}

class _ParentProfileScreenState extends State<ParentProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Hides the status bar completely
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    BlocProvider.of<ParentProfileCubit>(context).fetchProfile("ahmed1.ali@example.com");
  }

  @override
  void dispose() {
    // Restore the status bar when leaving this screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParentProfileCubit, ParentProfileState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              if (state is ParentProfileLoading)
                const Center(child: CircularProgressIndicator())
              else if (state is ParentProfileLoaded)
                Column(
                  children: [
                    // Header with Gradient and Profile Picture
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF052A43), Color(0xFF0D6AA9)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
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
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(35),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  'assets/images/default_profile.png',
                                  width: 120.w,
                                  height: 120.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // Edit Profile Image Action
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow,
                                    ),
                                    child: const Icon(Icons.camera_alt, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // Profile Information
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20.w),
                        child: ListView(
                          children: [
                            ProfileInfoField(
                                label: 'First Name',
                                value: state.profile.firstName),
                            ProfileInfoField(
                                label: 'Last Name',
                                value: state.profile.lastName),
                            ProfileInfoField(
                                label: 'Email Address',
                                value: state.profile.email),
                            ProfileInfoField(
                                label: 'Phone Number',
                                value: state.profile.phone),
                            ProfileInfoField(
                                label: 'Gender',
                                value: state.profile.gender),
                            ProfileInfoField(
                                label: 'Date of Birth',
                                value: state.profile.dateOfBirth),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              else if (state is ParentProfileError)
                  Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                else
                  const Center(child: Text("No profile data found")),
            ],
          ),
        );
      },
    );
  }
}
