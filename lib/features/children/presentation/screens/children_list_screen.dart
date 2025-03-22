import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../components/custom_button.dart'; // ✅ Import Custom Button
import '../../../../core/theme/app_theme.dart';
import '../../../parent_home/presentation/screens/home_screen.dart';
import '../cubit/children_cubit.dart';
import '../widgets/child_card.dart';
import 'add_child_form_screen.dart'; // ✅ Import Add Child Form

class ChildListScreen extends StatelessWidget {
  const ChildListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: Column(
          children: [
            // ✅ **"Done" Button on Top Right**
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // ✅ Aligns "Done" to the right
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
                            : null, // ✅ Disabled if no children exist
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: hasChildren ? Colors.amber : Colors.grey, // ✅ Disabled state color
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

            // ✅ **Centered Greeting Text**
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Text(
                    "Hello! Sarah",
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center, // ✅ Center the text
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Welcome to tracking your child",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center, // ✅ Center the text
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // ✅ **Add Child Button (Centered)**
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomButton(
                text: "Add Child",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddChildFormScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 32.h),

            // ✅ **Child List or Empty State**
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
                      separatorBuilder: (context, index) => SizedBox(height: 12.h), // ✅ Space between cards
                    );
                  }
                  return const Center(
                    child: Text(
                      "No children added yet.",
                      style: TextStyle(fontSize: 16, color: Colors.white70),
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
