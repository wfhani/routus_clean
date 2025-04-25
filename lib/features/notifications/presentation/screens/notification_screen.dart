import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String selectedTab = "all"; // Default filter
  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  void _fetchNotifications() {
    setState(() {
      notifications = []; // Empty placeholder (to be filled with API later)
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
                      ),
                      Text(
                        local.notificationTitle,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 28.w,
                        height: 28.h,
                        colorFilter: const ColorFilter.mode(Color(0xFFFDC70A), BlendMode.srcIn),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabButton(local.notificationAll, "all"),
                      _buildTabButton(local.notificationUnread, "unread"),
                      _buildTabButton(local.notificationEmergency, "emergency"),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: notifications.isEmpty
                        ? _buildEmptyState(local)
                        : _buildNotificationList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, String value) {
    final isSelected = selectedTab == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = value;
          _fetchNotifications();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? const Color(0xFF052A43) : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations local) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Center(
          child: SvgPicture.asset(
            selectedTab == "emergency"
                ? 'assets/images/emergency_notification.svg'
                : 'assets/images/empty_notification.svg',
            width: 300.w,
            height: 300.h,
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            selectedTab == "emergency"
                ? local.noNewsGoodNews
                : local.noNotificationsYet,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];
        return ListTile(
          leading: const Icon(Icons.notifications, color: Colors.white),
          title: Text(item['title'] ?? '', style: const TextStyle(color: Colors.white)),
          subtitle: Text(item['message'] ?? '', style: const TextStyle(color: Colors.white70)),
        );
      },
    );
  }
}
