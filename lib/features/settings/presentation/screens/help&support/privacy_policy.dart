import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(localizations.privacyPolicyTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/settings/Privacy policy-bro 1.svg',
                  width: 326.w,
                  height: 242.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection1Title,
                localizations.privacyPolicySection1Desc,
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection2Title,
                localizations.privacyPolicySection2Desc,
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection3Title,
                localizations.privacyPolicySection3Desc,
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection4Title,
                localizations.privacyPolicySection4Desc,
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection5Title,
                localizations.privacyPolicySection5Desc,
              ),
              SizedBox(height: 24.h),
              _policyCard(
                localizations.privacyPolicySection6Title,
                localizations.privacyPolicySection6Desc,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _policyCard(String title, String text) {
    return SizedBox(
      width: double.infinity, // Ensures full width
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0D6AA9),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              text,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
