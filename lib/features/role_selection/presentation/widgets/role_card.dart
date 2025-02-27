import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoleCard extends StatelessWidget {
  final String role;
  final bool isSelected;
  final Color color;
  final String imagePath;


  const RoleCard({
    Key? key,
    required this.role,
    required this.isSelected,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Adjust width
      padding: EdgeInsets.all(16), // Add padding for spacing
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 450, // Adjust image size
            height: 450,
          ),
          SizedBox(height: 12), // Space between image and text
          Text(
            role,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Comfortaa',
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}




