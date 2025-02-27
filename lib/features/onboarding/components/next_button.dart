import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 124, // Fixed width
      height: 44, // Fixed height
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFDC70A)), // Button background color
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.1)), // Ripple effect
        ),
        child: Text(
          "Next",
          style: GoogleFonts.comfortaa(
            fontSize: 20, // Adjusted font size for balance
            fontWeight: FontWeight.w600, // Semi-bold
            color: const Color(0xff052A43), // Text color
          ),
        ),
      ),
    );
  }
}
