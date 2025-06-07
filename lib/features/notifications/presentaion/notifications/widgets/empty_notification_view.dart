import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotificationsView extends StatelessWidget {
  const EmptyNotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          SvgPicture.asset('assets/images/empty_notifications.svg'),
          const Text(
            'You don’t have any notification yet ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
