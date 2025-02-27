import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final Function(bool) onChanged;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Comfortaa",
                    fontWeight: FontWeight.w600,
                    color: Color(0xff052A43),
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.8, // Adjust scale to make switch smaller (approx 40x40)
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: const Color(0x00ffffff),
                  activeTrackColor: const Color(0xff2FD159),
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: const Color(0x00ffffff),
                  splashRadius: 2,
                ),
              ),
            ],
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff052A43),
            ),
          ),
        ],
      ),
    );
  }
}
