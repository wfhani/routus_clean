import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  final List<String> labels = ["Home", "Contacts", "My Bus", "Profile"];
  final List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/contacts.svg",
    "assets/icons/bus.svg",
    "assets/icons/profile.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Shadow effect behind navbar
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, -3),
                ),
              ],
            ),
          ),
        ),

        // Curved Navigation Bar
        CurvedNavigationBar(
          index: widget.currentIndex,
          height: 65.0, // Keeps navbar compact
          backgroundColor: Colors.transparent,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          items: List.generate(
            icons.length,
                (index) => _buildNavIcon(icons[index], index),
          ),
          onTap: widget.onTabSelected,
        ),

        // Labels inside the navbar with fine-tuned spacing
        Positioned(
          bottom: 6, // Keeps the text inside the nav bar
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              labels.length,
                  (index) {
                double offset = 0; // Default position

                if (index == 0) offset = 4;  // Move "Home" slightly to the right
                if (index == 2) offset = -4; // Move "My Bus" slightly to the left (2px instead of 4px)
                if (index == 3) offset = -2; // Move "Profile" slightly to the left

                return Transform.translate(
                  offset: Offset(offset, 0), // Shift text slightly
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: widget.currentIndex == index
                            ? [Color(0xFF052A43), Color(0xFF0D6AA9)] // Selected gradient
                            : [Color(0xFFA4A4A4), Color(0xFFA4A4A4)], // Unselected gray
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold, // 👈 Make text bold
                        color: Colors.white, // Controlled by ShaderMask
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Builds only the navigation icons with gradient color
  Widget _buildNavIcon(String iconPath, int index) {
    bool isSelected = widget.currentIndex == index;

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: isSelected
              ? [Color(0xFF052A43), Color(0xFF0D6AA9)] // Gradient for selected
              : [Color(0xFFA4A4A4), Color(0xFFA4A4A4)], // Gray for unselected
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: SvgPicture.asset(
        iconPath,
        width: 30,
        height: 30,
      ),
    );
  }
}





