import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeActionButton extends StatelessWidget {
  final String iconPath;
  final String localizationKey;
  final VoidCallback? onTap;

   HomeActionButton({
    super.key,
    required this.iconPath,
    required this.localizationKey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Get localized label from the key
    final label = _getLocalizedLabel(l10n, localizationKey);
    print("🔁 Label: $label");

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 32.w,
                height: 32.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getLocalizedLabel(AppLocalizations l10n, String key) {
    switch (key) {
      case 'childProfile':
        return l10n.childProfile;
      case 'setFaceId':
        return l10n.setFaceId;
      case 'changeAddress':
        return l10n.changeAddress;
      case 'reportAbsent':
        return l10n.reportAbsent;
      default:
        return key;
    }
  }
}
