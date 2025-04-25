import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../components/custom_button.dart';
import '../../../../../core/cubit/locale_cubit.dart';
import 'widgets/language_button.dart';

void showLanguageBottomSheet(BuildContext context) {
  Locale selectedLocale = BlocProvider.of<LocaleCubit>(context).state;

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: 510.h,
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 32.h),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/settings/language_img.svg',
                  width: 87.w,
                  height: 75.h,
                ),
                SizedBox(height: 32.h),
                Text(
                  "Select Your Language",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comfortaa',
                    color: const Color(0xff223947),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Choose the language you prefer to use within the app for a personalized experience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Comfortaa',
                    color: const Color(0xff223947),
                  ),
                ),
                SizedBox(height: 32.h),
                LanguageButton(
                  language: "English",
                  onTap: () {
                    setState(() => selectedLocale = const Locale('en'));
                  },
                ),
                SizedBox(height: 16.h),
                LanguageButton(
                  language: "Arabic",
                  onTap: () {
                    setState(() => selectedLocale = const Locale('ar'));
                  },
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: 'save',
                  onPressed: () {
                    context.read<LocaleCubit>().setLocale(selectedLocale);
                    Navigator.of(context).pop();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
