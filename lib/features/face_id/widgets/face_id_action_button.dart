import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FaceIdActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;

  const FaceIdActionButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFFDC70A) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF052A43)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF052A43))),
                  Text(subtitle, style: const TextStyle(color: Color(0xFF052A43), fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}