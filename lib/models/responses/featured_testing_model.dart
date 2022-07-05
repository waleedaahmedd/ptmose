class FeaturedTestingModel {

  FeaturedTestingModel({this.id, this.image, this.title,this.date,this.description,this.location,this.openingTime});

  FeaturedTestingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    title = json['title'] as String;
    description = json['description'] as String;
    date = json['date'] as String;
    openingTime = json['openingTime'] as String;
    location = json['location'] as String;
  }
  int? id;
  String? image;
  String? title;
  String? description;
  String? date;
  String? openingTime;
  String? location;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['date'] = date;
    data['openingTime'] = openingTime;
    data['location'] = location;
    return data;
  }
}