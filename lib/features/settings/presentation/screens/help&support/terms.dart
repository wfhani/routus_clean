import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/theme/app_theme.dart';
import 'widgets/terms_items.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.termsAndConditions),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                Image.asset(
                  'assets/images/settings/terms (1).png',
                  height: 196.h,
                  width: 228.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24.h),
                Text(
                  local.termsIntro,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.h),
                TermsItem(
                  title: local.termsTitle1,
                  description: local.termsDesc1,
                ),
                TermsItem(
                  title: local.termsTitle2,
                  description: local.termsDesc2,
                ),
                TermsItem(
                  title: local.termsTitle3,
                  description: local.termsDesc3,
                ),
                TermsItem(
                  title: local.termsTitle4,
                  description: local.termsDesc4,
                ),
                TermsItem(
                  title: local.termsTitle5,
                  description: local.termsDesc5,
                ),
                TermsItem(
                  title: local.termsTitle6,
                  description: local.termsDesc6,
                ),
                TermsItem(
                  title: local.termsTitle7,
                  description: local.termsDesc7,
                ),
                TermsItem(
                  title: local.termsTitle8,
                  description: local.termsDesc8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
