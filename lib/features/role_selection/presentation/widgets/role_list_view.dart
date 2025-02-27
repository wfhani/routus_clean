import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'role_card.dart';
import '../cubit/role_selection_cubit.dart';

class RoleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> roles = [
      {
        "role": "Parent",
        "color": Color(0xff887BAA),
        "imagePath": "assets/images/parent.svg",
      },
      {
        "role": "Supervisor",
        "color": Color(0xff8AC8B2),
        "imagePath": "assets/images/supervisor.svg",
      },
      {
        "role": "School Administrator",
        "color": Color(0xffE1CEC0),
        "imagePath": "assets/images/admin.svg",
      },
      {
        "role": "Driver",
        "color": Color(0xff5F7E93),
        "imagePath": "assets/images/driver.svg",
      },

    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: roles.length,
        itemBuilder: (context, index) {
          final role = roles[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () => context.read<RoleSelectionCubit>().selectRole(index),
              child: RoleCard(
                role: role["role"] as String, // Explicitly cast to String
                isSelected: context.watch<RoleSelectionCubit>().state == index,
                color: role["color"] as Color, // Explicitly cast to Color
                imagePath: role["imagePath"] as String, // Explicitly cast to String
              ),
            ),
          );
        },
      ),
    );
  }
}


