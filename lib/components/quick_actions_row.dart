import 'package:flutter/material.dart';
import 'quick_action_button.dart';

class QuickActionsRow extends StatelessWidget {
  final List<Map<String, dynamic>> actions;

  const QuickActionsRow({
    Key? key,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: actions.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          final action = actions[index];
          return QuickActionButton(
            icon: action['icon'],
            label: action['label'],
            onPressed: action['onPressed'],
          );
        },
      ),
    );
  }
}
