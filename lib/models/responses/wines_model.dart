class WinesModel {

  WinesModel({this.id, this.image,this.title,this.description,this.year,this.price});

  WinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    image = json['image'] as String;
    title = json['title'] as String;
    year = json['year'] as String;
    price = json['price'] as double;
    description = json['description'] as String;
  }
  int? id;
  String? image;
  String? title;
  String? year;
  String? description;
  double? price;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['year'] = year;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}