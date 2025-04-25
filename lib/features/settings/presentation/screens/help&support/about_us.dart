import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/theme/app_theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.aboutUsTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF023047), Color(0xFF065A99)],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/settings/about_us_img.svg',
                    width: 250.w,
                  ),
                ),
                SizedBox(height: 16.h),
                _buildSectionTitle(localizations.aboutUsWelcome),
                _buildParagraph(localizations.aboutUsIntro),
                SizedBox(height: 18.h),
                _buildSectionTitle(localizations.aboutUsKeyFeatures),
                _buildFeatureItem(Icons.location_on, localizations.aboutUsFeature1Title, localizations.aboutUsFeature1Desc),
                _buildFeatureItem(Icons.how_to_reg, localizations.aboutUsFeature2Title, localizations.aboutUsFeature2Desc),
                _buildFeatureItem(Icons.chat, localizations.aboutUsFeature3Title, localizations.aboutUsFeature3Desc),
                _buildFeatureItem(Icons.warning, localizations.aboutUsFeature4Title, localizations.aboutUsFeature4Desc),
                SizedBox(height: 18.h),
                _buildSectionTitle(localizations.aboutUsWhyChoose),
                _buildFeatureItem(Icons.security, localizations.aboutUsWhy1Title, localizations.aboutUsWhy1Desc),
                _buildFeatureItem(Icons.school, localizations.aboutUsWhy2Title, localizations.aboutUsWhy2Desc),
                _buildFeatureItem(Icons.directions_bus, localizations.aboutUsWhy3Title, localizations.aboutUsWhy3Desc),
                SizedBox(height: 18.h),
                _buildSectionTitle(localizations.aboutUsInclusivityTitle),
                _buildParagraph(localizations.aboutUsInclusivityDesc),
                SizedBox(height: 12.h),
                _buildParagraph(localizations.aboutUsCommitment),
                SizedBox(height: 8.h),
                Center(
                  child: Text(
                    localizations.aboutUsClosing,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Comfortaa',
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14.sp,
          height: 1.5,
          fontFamily: 'Comfortaa',
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.sp,
                    height: 1.4,
                    fontFamily: 'Comfortaa',
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
