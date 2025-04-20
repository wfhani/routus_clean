import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final school = schoolController.text.trim();
    final studentId = studentIdController.text.trim();

    if (school.isEmpty || studentId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // ✅ Show Loading Screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoadingScreen(isSuccess: false)), // Default false
    );

    // ✅ Add child and wait for response
    context.read<ChildrenCubit>().addChild(school, studentId);
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // **Title**
              Text(
                "Add Child",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 12.h),
              Text(
                "Enter your child’s details to start tracking their bus journey.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 40.h),

              // **Custom Text Fields**
              CustomTextField(
                controller: schoolController,
                hintText: "Enter School Name",
                obscureText: false,
              ),
              CustomTextField(
                controller: studentIdController,
                hintText: "Enter Student ID",
                obscureText: false,
              ),
              SizedBox(height: 32.h),

              // **Bloc Listener to Handle Loading, Success & Error States**
              BlocListener<ChildrenCubit, ChildrenState>(
                listener: (context, state) {
                  if (state is ChildrenError) {
                    // ❌ Show failure on LoadingScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoadingScreen(isSuccess: false)),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }

                  if (state is ChildrenLoaded) {
                    // ✅ Show success on LoadingScreen, then go to list
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
                    text: "Add Child",
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
