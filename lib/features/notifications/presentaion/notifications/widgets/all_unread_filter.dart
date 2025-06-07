import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_cubit.dart';
import 'package:routus_clean/features/notifications/presentaion/notifications/notifications_state.dart';
import 'package:routus_clean/styles.dart';

class AllUnreadFilter extends StatelessWidget {
  const AllUnreadFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<NotificationsCubit>(context);
        return Row(
          spacing: 12,
          children: [
            _RoundedContainer(
              selected: cubit.selectedFilter == 'All',
              text: 'All',
              onTap: () => cubit.applyAllFilter(),
            ),
            _RoundedContainer(
              selected: cubit.selectedFilter == 'Unread',
              text: 'Unread',
              onTap: () => cubit.applyUnreadFilter(),
            ),
          ],
        );
      },
    );
  }
}

class _RoundedContainer extends StatelessWidget {
  const _RoundedContainer(
      {super.key,
      required this.selected,
      required this.text,
      required this.onTap});

  final bool selected;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFF052A43),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: !selected ? Colors.white : Styles.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
