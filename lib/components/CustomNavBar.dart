// components/curved_nav_bar.dart
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurvedNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CurvedNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<String> icons = [
    "assets/icons/navbar/home_selected.svg",
    "assets/icons/navbar/contacts_selected.svg",
    "assets/icons/navbar/bus_selected.svg",
    "assets/icons/navbar/profile_selected.svg",
  ];

  final List<String> labels = ["Home", "Contacts", " My Bus", "Profile"];

  @override
  Widget build(BuildContext context) {
    // Primary color for active states
    final Color primaryColor = Color(0xff052A43).withOpacity(0.8);
    final Color inactiveColor = primaryColor.withOpacity(0.5);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 72,
        index: selectedIndex,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: onItemTapped,
        items: List.generate(icons.length, (index) {
          bool isActive = selectedIndex == index;

          return CurvedNavigationBarItem(
            child: SvgPicture.asset(
              icons[index],
              width: isActive ? 40 : 33,
              height: isActive ? 40 : 33,
              colorFilter: isActive
                  ? null
                  : ColorFilter.mode(
                inactiveColor,
                BlendMode.srcIn,
              ),
            ),
            label: labels[index],
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: "Comfortaa",
              fontWeight: FontWeight.bold,
              color: isActive ? primaryColor : inactiveColor,
            ),
          );
        }),
      ),
    );
  }
}
