import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_text_field.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../components/loading_screen.dart';
import '../cubit/children_cubit.dart';
import 'children_list_screen.dart';

class AddChildFormScreen extends StatefulWidget {
  const AddChildFormScreen({super.key});

  @override
  _AddChildFormScreenState createState() => _AddChildFormScreenState();
}

class _AddChildFormScreenState extends State<AddChildFormScreen> {
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  void _addChild(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final school = schoolController.text.trim();
    final studentId = studentIdController.text.trim();

    if (school.isEmpty || studentId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(local.fillAllFields)),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoadingScreen(isSuccess: false)),
    );

    context.read<ChildrenCubit>().addChild(school, studentId);
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                local.addChildTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 12.h),
              Text(
                local.addChildSubtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 40.h),

              CustomTextField(
                controller: schoolController,
                hintText: local.enterSchoolName,
                obscureText: false,
              ),
              CustomTextField(
                controller: studentIdController,
                hintText: local.enterStudentId,
                obscureText: false,
              ),
              SizedBox(height: 32.h),

              BlocListener<ChildrenCubit, ChildrenState>(
                listener: (context, state) {
                  if (state is ChildrenError) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoadingScreen(isSuccess: false)),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }

                  if (state is ChildrenLoaded) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoadingScreen(isSuccess: true)),
                    );

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const ChildListScreen()),
                      );
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 16.h),
                  child: CustomButton(
                    text: local.addChildButton,
                    onPressed: () => _addChild(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
