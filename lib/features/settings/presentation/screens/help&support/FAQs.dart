import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/theme/app_theme.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(local.faqTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: ListView(
            children: [
              SizedBox(height: 16.h),
              _buildSectionTitle(context, local.faqSectionGeneral),
              _buildFAQItem(context, local.faqQ1, local.faqA1),
              _buildFAQItem(context, local.faqQ2, local.faqA2),

              _buildSectionTitle(context, local.faqSectionTracking),
              _buildFAQItem(context, local.faqQ3, local.faqA3),
              _buildFAQItem(context, local.faqQ4, local.faqA4),
              _buildFAQItem(context, local.faqQ5, local.faqA5),

              _buildSectionTitle(context, local.faqSectionSafety),
              _buildFAQItem(context, local.faqQ6, local.faqA6),
              _buildFAQItem(context, local.faqQ7, local.faqA7),

              _buildSectionTitle(context, local.faqSectionSupport),
              _buildFAQItem(context, local.faqQ8, local.faqA8),
              _buildFAQItem(context, local.faqQ9, local.faqA9),
              _buildFAQItem(context, local.faqQ10, local.faqA10),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              maintainState: true,
              collapsedIconColor: Colors.black54,
              iconColor: Colors.black87,
              tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              title: Text(
                "Q: $question",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Comfortaa',
                  color: const Color(0xFF052A43),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Divider(color: Colors.amber, thickness: 1.5, indent: 16.w, endIndent: 16.w),
                ),
                Text(
                  "Ans: $answer",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Comfortaa',
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
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
}
