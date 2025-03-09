import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routus_clean/features/settings/presentation/screens/account/change_password.dart';
import 'package:routus_clean/features/settings/presentation/screens/help&support/FAQs.dart';
import 'package:routus_clean/features/settings/presentation/screens/help&support/privacy_policy.dart';
import 'package:routus_clean/features/settings/presentation/screens/help&support/terms.dart';
import 'package:routus_clean/features/settings/presentation/screens/settings/widgets/settings_tile.dart';

import '../../../../../core/theme/app_theme.dart';
import '../account/DeleteAccountDialog.dart';
import '../help&support/about_us.dart';
import '../help&support/contact_us.dart';
import '../preferences/language_bottom_sheet.dart';
import '../preferences/notification.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Preference"),
              _buildSettingsContainer([
                SettingsTile(
                  title: "Notification",
                  iconPath: 'assets/icons/settings_icons/notification.svg',
                  onTap: () {
                    _navigateTo(context, const NotificationScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "Language",
                  iconPath: 'assets/icons/settings_icons/language.svg',
                  onTap: () {
                    showLanguageBottomSheet(context); //
                  }
                  ,
                ),
              ]),

              SizedBox(height: 16.h),

              _buildSectionTitle("Help & Support"),
              _buildSettingsContainer([
                SettingsTile(
                  title: "Privacy policy",
                  iconPath: 'assets/icons/settings_icons/priv.svg',
                  onTap: () {
                    _navigateTo(context, const PrivacyPolicyScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "About us",
                  iconPath: 'assets/icons/settings_icons/about.svg',
                  onTap: () {
                    _navigateTo(context, const AboutUsScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "FAQs",
                  iconPath: 'assets/icons/settings_icons/FAQs.svg',
                  onTap: () {
                    _navigateTo(context, const FAQScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "Terms & conditions",
                  iconPath: 'assets/icons/settings_icons/terms.svg',
                  onTap: () {
                    _navigateTo(context, const TermsAndConditionsScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "Contact us",
                  iconPath: 'assets/icons/settings_icons/contact us.svg',
                  onTap: () {
                    _navigateTo(context, const ContactUsScreen());
                  },
                ),
              ]),

              SizedBox(height: 16.h),

              _buildSectionTitle("Account"),
              _buildSettingsContainer([
                SettingsTile(
                  title: "Change password",
                  iconPath: 'assets/icons/settings_icons/change pass.svg',
                  onTap: () {
                    _navigateTo(context, ChangePasswordScreen());
                  },
                ),
                _buildDivider(),
                SettingsTile(
                  title: "Delete account",
                  iconPath: 'assets/icons/settings_icons/delete acc.svg',
                  onTap: () {
                    showDeleteAccountDialog(context);
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Divider(height: 0.8.h, color: Colors.grey.shade300),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}