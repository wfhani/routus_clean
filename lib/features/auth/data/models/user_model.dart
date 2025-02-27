class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String name;
  final String email;
  final String phone; // Added phoneNumber field

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
    required this.phone, // Include in constructor
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'] ?? '', // Ensure it handles null values
    );
  }
}
