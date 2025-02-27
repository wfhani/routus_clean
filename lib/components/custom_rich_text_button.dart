import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichTextButton extends StatelessWidget {
  final String regularText;
  final String buttonText;
  final Widget navigateToScreen; // The screen widget to navigate to

  CustomRichTextButton({
    required this.regularText,
    required this.buttonText,
    required this.navigateToScreen, // Pass the screen widget directly
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: regularText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400, // Regular weight
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: buttonText,
            style: TextStyle(
              color: Color(0xffFDC70A),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w400, // Regular weight
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to the screen directly
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => navigateToScreen),
                );
              },
          ),
        ],
      ),
    );
  }
}
