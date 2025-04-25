import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/cubit/locale_cubit.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LocaleCubit>().stream.listen((locale) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            local.setNewPassword,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(23.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Text(
                  local.setNewPassword,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 25.h),
                Text(
                  local.setPasswordHint,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  hintText: local.newPassword,
                  obscureText: true,
                  controller: newPasswordController,
                ),
                CustomTextField(
                  hintText: local.confirmNewPassword,
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                const Expanded(child: SizedBox()),
                SizedBox(height: 16.h),
                CustomButton(
                  text: local.save,
                  onPressed: () {
                    // Handle save logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
