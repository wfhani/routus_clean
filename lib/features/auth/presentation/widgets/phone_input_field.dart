import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController countryCodeController;
  final TextEditingController phoneController;
  final String hintText;

  PhoneInputField({
    required this.countryCodeController,
    required this.phoneController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Country Code Input Field (+20)
        Container(
          width: 66.0, // Set a fixed width for the country code input
          height: 44.0, // Set the same height as phone number input
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: TextField(
            controller: countryCodeController,
            decoration: InputDecoration(
              hintText: '+20', // Egypt country code
              hintStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                color: Color(0xFFAFB8BD), // Text color
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Comfortaa',
              color: Color(0xFFAFB8BD), // Text color
            ),
            textAlign: TextAlign.center,
            enabled: false, // Make it non-editable
          ),
        ),
        SizedBox(width: 15.0), // Space between country code and phone number fields

        // Phone Number Input Field
        Expanded(
          child: Container(
            height: 44.0, // Same height as country code input
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Comfortaa',
                  color: Color(0xFFAFB8BD), // Text color
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              ),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Comfortaa',
                color: Color(0xFFAFB8BD), // Text color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
