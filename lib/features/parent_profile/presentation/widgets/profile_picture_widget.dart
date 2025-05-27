// lib/features/parent_profile/presentation/widgets/profile_picture_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureWidget extends StatelessWidget {
  final String? imageUrl;
  final void Function(String) onImageSelected;

  const ProfilePictureWidget({
    super.key,
    required this.imageUrl,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Profile Image Circle
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.white,
          backgroundImage: imageUrl != null
              ? NetworkImage(imageUrl!)
              : const AssetImage('assets/images/default_profile.png')
          as ImageProvider,
        ),
        // Edit Icon
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // Call the image picker handler
              onImageSelected("path/to/selected/image.png");
            },
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFDC70A),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt, size: 18, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
