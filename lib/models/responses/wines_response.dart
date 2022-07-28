class Wine {
  int? age;
  String? wineName;
  int? id;
  String? wineType;
  int? price;
  String? image;

  Wine(
      {this.age,
        this.wineName,
        this.id,
        this.wineType,
        this.price,
        this.image});

  Wine.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    wineName = json['wineName'];
    id = json['id'];
    wineType = json['wineType'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['wineName'] = this.wineName;
    data['id'] = this.id;
    data['wineType'] = this.wineType;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}