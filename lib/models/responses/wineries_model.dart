class WineriesModel {

  WineriesModel({this.id, this.image,this.title,this.description,this.closingTime});

  WineriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    title = json['title'] as String;
    closingTime = json['closingTime'] as String;
    description = json['description'] as String;
  }
  int? id;
  String? image;
  String? title;
  String? closingTime;
  String? description;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['closingTime'] = closingTime;
    data['description'] = description;
    return data;
  }
}