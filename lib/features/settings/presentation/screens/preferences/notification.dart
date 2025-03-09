import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/features/settings/presentation/screens/preferences/widgets/NotificationCard.dart';
import 'package:routus_clean/features/settings/presentation/screens/preferences/widgets/reset_button.dart';

import '../../../../../core/theme/app_theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationSettingsScreenState createState() => NotificationSettingsScreenState();
}

class NotificationSettingsScreenState extends State<NotificationScreen> {
  // Notification toggles
  bool busJourneyUpdates = true;
  bool safetyNotifications = true;
  bool studentStatus = true;
  bool realTimeTracking = true;
  bool showPreview = true;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Notification'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove shadow
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Text(
                  "Adjust notification",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Notification Settings List
              NotificationCard(
                title: "Bus Journey Updates",
                subtitle: "Alerts when the bus starts, arrives at a pickup point, or reaches the destination.",
                value: busJourneyUpdates,
                onChanged: (value) {
                  setState(() {
                    busJourneyUpdates = value;
                  });
                },
              ),
              NotificationCard(
                title: "Safety Notifications",
                subtitle: "Updates on delays, route changes, and safety advisories.",
                value: safetyNotifications,
                onChanged: (value) {
                  setState(() {
                    safetyNotifications = value;
                  });
                },
              ),
              NotificationCard(
                title: "Student Status",
                subtitle: "Confirmation alerts when a student gets on/off the bus or arrives at school.",
                value: studentStatus,
                onChanged: (value) {
                  setState(() {
                    studentStatus = value;
                  });
                },
              ),
              NotificationCard(
                title: "Real-Time Tracking",
                subtitle: "Notifications when the bus departs from or arrives at a specific location.",
                value: realTimeTracking,
                onChanged: (value) {
                  setState(() {
                    realTimeTracking = value;
                  });
                },
              ),
              NotificationCard(
                title: "Show Preview",
                subtitle: "Preview message text inside new message notifications.",
                value: showPreview,
                onChanged: (value) {
                  setState(() {
                    showPreview = value;
                  });
                },
              ),

              SizedBox(height: 20.h),


              Center(
                child: ResetButton(
                  onPressed: () {
                    setState(() {
                      busJourneyUpdates = false;
                      safetyNotifications = false;
                      studentStatus = false;
                      realTimeTracking = false;
                      showPreview = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Notification settings reset.")),
                    );
                  },
                ),
              ),

              SizedBox(height: 12.h),
              Center(
                child: Text(
                  "Reset all notification settings and restore them to their default state.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
