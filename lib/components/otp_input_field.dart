import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPInputField extends StatefulWidget {
  @override
  _OTPInputFieldState createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the OTP fields
      children: List.generate(4, (index) {
        return Row(
          children: [
            _buildOTPField(index),
            if (index < 3) SizedBox(width: 15.w), // Add spacing between boxes
          ],
        );
      }),
    );
  }

  Widget _buildOTPField(int index) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.sp),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              _focusNodes[index].unfocus();
              // Optionally handle the completed OTP input
              String otp = _controllers.map((controller) => controller.text).join();
              print('Entered OTP: $otp');
            }
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none, // Removes border from TextField
        ),
      ),
    );
  }
}
