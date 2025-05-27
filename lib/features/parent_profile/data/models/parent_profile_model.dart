// lib/features/parent_profile/data/models/parent_profile_model.dart
class ParentProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String dateOfBirth; // Corrected field name
  final String profilePicture;

  ParentProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.profilePicture,
  });

  factory ParentProfileModel.fromJson(Map<String, dynamic> json) {
    return ParentProfileModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone_number'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '', // Use correct field
      profilePicture: json['profile_picture'] ?? '',
    );
  }
}
