import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routus_clean/features/settings/presentation/screens/preferences/widgets/NotificationCard.dart';
import 'package:routus_clean/features/settings/presentation/screens/preferences/widgets/reset_button.dart';

import '../../../../../core/theme/app_theme.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  NotificationSettingsScreenState createState() => NotificationSettingsScreenState();
}

class NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool busJourneyUpdates = true;
  bool safetyNotifications = true;
  bool studentStatus = true;
  bool realTimeTracking = true;
  bool showPreview = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(localizations.notification),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Text(
                    localizations.adjustNotification,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                NotificationCard(
                  title: localizations.busJourneyUpdates,
                  subtitle: localizations.busJourneyUpdatesDesc,
                  value: busJourneyUpdates,
                  onChanged: (value) {
                    setState(() {
                      busJourneyUpdates = value;
                    });
                  },
                ),
                NotificationCard(
                  title: localizations.safetyNotifications,
                  subtitle: localizations.safetyNotificationsDesc,
                  value: safetyNotifications,
                  onChanged: (value) {
                    setState(() {
                      safetyNotifications = value;
                    });
                  },
                ),
                NotificationCard(
                  title: localizations.studentStatus,
                  subtitle: localizations.studentStatusDesc,
                  value: studentStatus,
                  onChanged: (value) {
                    setState(() {
                      studentStatus = value;
                    });
                  },
                ),
                NotificationCard(
                  title: localizations.realTimeTracking,
                  subtitle: localizations.realTimeTrackingDesc,
                  value: realTimeTracking,
                  onChanged: (value) {
                    setState(() {
                      realTimeTracking = value;
                    });
                  },
                ),
                NotificationCard(
                  title: localizations.showPreview,
                  subtitle: localizations.showPreviewDesc,
                  value: showPreview,
                  onChanged: (value) {
                    setState(() {
                      showPreview = value;
                    });
                  },
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    localizations.previewMessage,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),

                SizedBox(height: 14.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SizedBox(
                    width: double.infinity,
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
                          SnackBar(content: Text(localizations.notificationReset)),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    localizations.notificationResetDesc,
                    style: TextStyle(color: Colors.white, fontSize: 13.sp),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
