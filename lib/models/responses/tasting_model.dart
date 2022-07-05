class TastingModel {

  TastingModel({this.id, this.image, this.location,this.date,this.title,this.address,this.workingHours});

  TastingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    location = json['location'] as String;
    title = json['title'] as String;
    date = json['date'] as String;
    workingHours = json['workingHours'] as String;
    address = json['address'] as String;
  }
  int? id;
  String? image;
  String? location;
  String? title;
  String? date;
  String? workingHours;
  String? address;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['location'] = location;
    data['title'] = title;
    data['date'] = date;
    data['workingHours'] = workingHours;
    data['address'] = address;
    return data;
  }
}