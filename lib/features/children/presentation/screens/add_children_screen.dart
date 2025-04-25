import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:routus_clean/core/theme/app_theme.dart';
import '../../../../components/custom_button.dart';
import '../cubit/children_cubit.dart';
import 'add_child_form_screen.dart';
import 'children_list_screen.dart';

class AddChildrenScreen extends StatefulWidget {
  const AddChildrenScreen({super.key});

  @override
  _AddChildrenScreenState createState() => _AddChildrenScreenState();
}

class _AddChildrenScreenState extends State<AddChildrenScreen> {
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),

                Text(
                  local.helloSarah,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 12.h),
                Text(
                  local.welcomeTracking,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 32.h),

                SvgPicture.asset(
                  'assets/images/add_child.svg',
                  width: 166.w,
                  height: 144.h,
                ),
                SizedBox(height: 32.h),

                BlocConsumer<ChildrenCubit, ChildrenState>(
                  listener: (context, state) {
                    if (state is ChildrenError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    if (state is ChildrenLoaded) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const ChildListScreen()),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ChildrenLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      text: local.addChildButton,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const AddChildFormScreen()),
                        );
                      },
                    );
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
