import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import 'package:routus_clean/features/parent_home/presentation/screens/video_player_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorialCard extends StatelessWidget {
  const TutorialCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF052A43),
            Color(0xFF0D6AA9),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/tutorial_illustration.svg',
            width: 130.w,
            height: 130.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Text(
                        l10n.tutorialTitle,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comfortaa',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      l10n.tutorialSubtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Comfortaa',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 5.h,
                  left: Directionality.of(context) == TextDirection.rtl ? 5.w : null,
                  right: Directionality.of(context) == TextDirection.ltr ? 5.w : null,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.black.withOpacity(0.5),
                        size: 24.sp,
                      ),
                    ),
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
