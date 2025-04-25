import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../components/custom_button.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../parent_home/presentation/screens/home_screen.dart';
import '../cubit/children_cubit.dart';
import '../widgets/child_card.dart';
import 'add_child_form_screen.dart';

class ChildListScreen extends StatelessWidget {
  const ChildListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return GradientScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<ChildrenCubit, ChildrenState>(
                    builder: (context, state) {
                      bool hasChildren = state is ChildrenLoaded && state.children.isNotEmpty;
                      return TextButton(
                        onPressed: hasChildren
                            ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                          );
                        }
                            : null,
                        child: Text(
                          local.done,
                          style: TextStyle(
                            color: hasChildren ? Colors.amber : Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Text(
                    local.helloSarah,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    local.welcomeTracking,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                text: local.addChildButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddChildFormScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 32.h),

            Expanded(
              child: BlocBuilder<ChildrenCubit, ChildrenState>(
                builder: (context, state) {
                  if (state is ChildrenLoaded && state.children.isNotEmpty) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: state.children.length,
                      itemBuilder: (context, index) {
                        return ChildCard(child: state.children[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                    );
                  }
                  return Center(
                    child: Text(
                      local.noChildrenYet,
                      style: const TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
