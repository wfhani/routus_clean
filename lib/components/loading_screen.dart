import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_theme.dart';

class LoadingScreen extends StatefulWidget {
  final bool isSuccess;

  const LoadingScreen({super.key, required this.isSuccess});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showResult = true;
      });

      // Auto navigate after 1.5 seconds if success
      if (widget.isSuccess) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: SizedBox(
          width: 133.w,
          height: 133.h,
          child: showResult
              ? widget.isSuccess
              ? const Icon(Icons.check_circle, color: Colors.green, size: 100)
              : const Icon(Icons.error, color: Colors.red, size: 100)
              : CircularProgressIndicator(
            strokeWidth: 15.w,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFDC70A)),
            backgroundColor: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
