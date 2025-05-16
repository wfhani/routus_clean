import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routus_clean/features/notifications/data/models/notifcations_response.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationItem});

  final NotificationItem notificationItem;

  String _getNotSvg(String modelType) {
    switch (modelType) {
      case 'announcement':
        return 'announcement';
      case 'delay':
        return 'delay';
      case 'departure':
        return 'departure';
      case 'drop_off':
        return 'drop_off';
      default:
        return 'default';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/notification_types/${_getNotSvg(notificationItem.modelType!)}.svg',
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      notificationItem.body!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        notificationItem.createdAt ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            color: const Color(0xFF052A43).withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}
