import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  CustomTextField({
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _isObscured = ValueNotifier<bool>(obscureText);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isObscured,
        builder: (context, isObscured, child) {
          return SizedBox(
            width: 330.w,
            height: 44.h,
            child: TextField(
              controller: controller,
              obscureText: isObscured,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFF052A43).withOpacity(0.36),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF052A43),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF052A43),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 12.0,
                ),
                isDense: true,
                suffixIcon: obscureText
                    ? IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF052A43).withOpacity(0.60),
                    size: 24.0,
                  ),
                  onPressed: () {
                    _isObscured.value = !isObscured;
                  },
                )
                    : null,
              ),
              style: TextStyle(
                color: Color(0xFF052A43).withOpacity(0.80),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
