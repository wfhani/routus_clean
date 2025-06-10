import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/features/contacts/widgets/contacts_card.dart';
import 'package:routus_clean/features/contacts/widgets/child_selector_bottom_sheet.dart';
import 'package:routus_clean/features/contacts/widgets/feedback_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ✅ Localization import

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  void _showChildFilterSheet(BuildContext context) {
    showChildSelectorBottomSheet(context);
  }

  void _showFeedbackSheet(BuildContext context) {
    showFeedbackBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/settings.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/notification.svg',
                          width: 28.w,
                          height: 28.h,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications');
                        },
                      ),
                    ],
                  ),

                  /// Title and Subtitle
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.yourSupportTeam,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          AppLocalizations.of(context)!.supportTeamSubtitle,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),


                  SizedBox(height: 40.h),

                  /// Filter Icon
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _showChildFilterSheet(context),
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  /// Cards
                  ContactsCard(
                    imagePath: 'assets/images/the_team/shahd.png',
                    name: "Shahd Mahmoud",
                    role: AppLocalizations.of(context)!.busSupervisor, // ✅ localized
                    onTap: () => _showFeedbackSheet(context),
                  ),
                  ContactsCard(
                    imagePath: 'assets/images/the_team/essam.png',
                    name: "Mohamed Essam",
                    role: AppLocalizations.of(context)!.driver, // ✅ localized
                    onTap: () => _showFeedbackSheet(context),
                  ),
                  ContactsCard(
                    imagePath: 'assets/images/the_team/ghandour.png',
                    name: "Mohamed Taha",
                    role: AppLocalizations.of(context)!.schoolAdmin, // ✅ localized
                    onTap: () => _showFeedbackSheet(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
