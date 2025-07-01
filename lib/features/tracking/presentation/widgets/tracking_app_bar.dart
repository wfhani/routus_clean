import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routus_clean/components/children_filter/presentation/children_filter_view.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_view.dart';

class TrackingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrackingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16.0),
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const NotificationsPage(),
          )),
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
          ),
        ),
      ),
      leadingWidth: 42,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: InkWell(
            onTap: () => showModalBottomSheet(
              showDragHandle: true,
              context: context,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (context) => const ChildrenFilterPage(),
            ).then(
              (value) {
                if (value is int) {
                  //fetch bus location
                }
              },
            ),
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 22,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
