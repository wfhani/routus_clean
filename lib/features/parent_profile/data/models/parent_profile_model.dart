class ParentProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String birthDate;

  ParentProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
  });

  factory ParentProfileModel.fromJson(Map<String, dynamic> json) {
    return ParentProfileModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      birthDate: json['birth_date'] ?? '',
    );
  }
}
