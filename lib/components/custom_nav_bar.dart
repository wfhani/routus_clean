import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final List<String> icons = [
    "assets/icons/home.svg",
    "assets/icons/contacts.svg",
    "assets/icons/bus.svg",
    "assets/icons/profile.svg"
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final labels = [
      l10n.navHome,
      l10n.navContacts,
      l10n.navBus,
      l10n.navProfile,
    ];

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
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
        CurvedNavigationBar(
          index: widget.currentIndex,
          height: 65.0,
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
        Positioned(
          bottom: 6,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              labels.length,
                  (index) {
                double offset = 0;
                if (index == 0) offset = 4;
                if (index == 2) offset = -4;
                if (index == 3) offset = -2;

                return Transform.translate(
                  offset: Offset(offset, 0),
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: widget.currentIndex == index
                            ? [Color(0xFF052A43), Color(0xFF0D6AA9)]
                            : [Color(0xFFA4A4A4), Color(0xFFA4A4A4)],
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
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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

  Widget _buildNavIcon(String iconPath, int index) {
    bool isSelected = widget.currentIndex == index;

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: isSelected
              ? [Color(0xFF052A43), Color(0xFF0D6AA9)]
              : [Color(0xFFA4A4A4), Color(0xFFA4A4A4)],
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
