class FilterChild {
  int? id;
  String? name;
  String? schoolName;
  int? busId;
  String? photoUrl;

  FilterChild({this.id, this.name, this.schoolName, this.busId, this.photoUrl});

  FilterChild.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    schoolName = json['school_name'];
    busId = json['bus_id'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['school_name'] = schoolName;
    data['bus_id'] = busId;
    data['photo_url'] = photoUrl;
    return data;
  }
}
