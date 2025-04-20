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
        // ⭕ Profile Image Circle
        CircleAvatar(
          radius: 50.r,
          backgroundColor: Colors.white,
          backgroundImage: imageUrl != null
              ? NetworkImage(imageUrl!)
              : const AssetImage('assets/images/default_profile.png')
          as ImageProvider,
        ),

        // ⬆️ Upload Icon
        Positioned(
          bottom: 0,
          right: 4.w,
          child: GestureDetector(
            onTap: () {
              // Call the image picker handler
              // You can wire this to open a file/image picker
              onImageSelected("path/to/selected/image.png");
            },
            child: Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFDC70A),
              ),
              child: const Icon(Icons.camera_alt, size: 18, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}


