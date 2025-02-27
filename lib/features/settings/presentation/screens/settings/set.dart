// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF023047), // Dark blue background
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // App Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                     onPressed: () {}, // Add navigation logic
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     "Settings",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // Preference Section
//             _buildSectionTitle("Preference"),
//             _buildSettingsCard([
//               _buildSettingsTile(Icons.notifications, "Notification"),
//               _buildSettingsTile(Icons.language, "Language"),
//             ]),
//
//             // Help & Support Section
//             _buildSectionTitle("Help & Support"),
//             _buildSettingsCard([
//               _buildSettingsTile(Icons.privacy_tip, "Privacy policy"),
//               _buildSettingsTile(Icons.info, "About us"),
//               _buildSettingsTile(Icons.help, "FAQs"),
//               _buildSettingsTile(Icons.article, "Terms & conditions"),
//               _buildSettingsTile(Icons.contact_support, "Contact us"),
//             ]),
//
//             // Account Section
//             _buildSectionTitle("Account"),
//             _buildSettingsCard([
//               _buildSettingsTile(Icons.lock, "Change password"),
//               _buildSettingsTile(Icons.delete, "Delete account"),
//             ]),
//
//             const Spacer(),
//
//             // Bottom Indicator
//             Center(
//               child: Container(
//                 width: 80,
//                 height: 5,
//                 margin: const EdgeInsets.only(bottom: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white54,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Section Title Widget
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Text(
//         title,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   // Card for grouped settings
//   Widget _buildSettingsCard(List<Widget> children) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(children: children),
//     );
//   }
//
//   // Individual settings tile
//   Widget _buildSettingsTile(IconData icon, String title) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black87),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//       ),
//       trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54),
//       onTap: () {}, // Add navigation logic
//     );
//   }
// }