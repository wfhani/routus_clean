import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/cubit/locale_cubit.dart';

class HomeQuickActions extends StatelessWidget {
  HomeQuickActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        final l10n = AppLocalizations.of(context)!;

        return Padding(
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildActionButton(
                  context,
                  "assets/icons/child_profile.svg",
                  l10n.childProfile,
                  "/childProfileScreen",
                ),
                _buildActionButton(
                  context,
                  "assets/icons/face_id.svg",
                  l10n.setFaceId,
                  "/faceIdScreen",
                ),
                _buildActionButton(
                  context,
                  "assets/icons/change_address.svg",
                  l10n.changeAddress,
                  "/changeAddressScreen",
                ),
                _buildActionButton(
                  context,
                  "assets/icons/report_absent.svg",
                  l10n.reportAbsent,
                  "/reportAbsentScreen",
                ),
                SizedBox(
                  width: 100.w,
                  child: _buildActionButton(
                    context,
                    "assets/icons/payment.svg",
                    l10n.payment,
                    "/paymentScreen",
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: _buildActionButton(
                    context,
                    "assets/icons/payment.svg",
                    l10n.removeAddChildren,
                    "/removeAddChildrenScreen",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton(
      BuildContext context, String iconPath, String label, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: SizedBox(
        width: 85.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF052A43),
                    Color(0xFF0D6AA9),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.normal,
                color: const Color(0xFF052A43),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
