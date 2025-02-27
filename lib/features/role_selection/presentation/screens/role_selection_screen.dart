import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routus_clean/features/role_selection/presentation/widgets/role_list_view.dart';

import '../cubit/role_selection_cubit.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF052A43), // Dark blue
              Color(0xFF0D6AA9), // Lighter blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Choose your role',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select your role to personalize your experience',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white70,
                fontFamily: 'Comfortaa',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const Expanded(child: RoleListView()),

            const SizedBox(height: 50), // Added space between the cards and the button

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFDC70A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 150),
                ),
                onPressed: () {
                  final selectedIndex = context.read<RoleSelectionCubit>().state;
                  if (selectedIndex != -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Selected role: ${selectedIndex + 1}'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



