class FilterChild {
  String? id;
  String? name;
  String? schoolName;
  String? photoUrl;

  FilterChild({this.id, this.name, this.schoolName, this.photoUrl});

  FilterChild.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name'];
    schoolName = json['school_name'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['school_name'] = schoolName;
    data['photo_url'] = photoUrl;
    return data;
  }
}
