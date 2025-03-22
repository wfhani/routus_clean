class ChildModel {
  final int id;
  final String name;
  final String schoolName;
  final String photo;

  ChildModel({
    required this.id,
    required this.name,
    required this.schoolName,
    required this.photo,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      schoolName: json['school_name'] ?? 'Unknown School',
      photo: json['photo'] != null ? "https://peaceful-alien-indirectly.ngrok-free.app/${json['photo']}" : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'school_name': schoolName,
      'photo': photo,
    };
  }
}
