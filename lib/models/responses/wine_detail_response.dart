class WineDetailResponse {
  WineDetailResponseData? data;

  WineDetailResponse({this.data});

  WineDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new WineDetailResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WineDetailResponseData {
  GetWineById? getWineById;

  WineDetailResponseData({this.getWineById});

  WineDetailResponseData.fromJson(Map<String, dynamic> json) {
    getWineById = json['getWineById'] != null
        ? new GetWineById.fromJson(json['getWineById'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getWineById != null) {
      data['getWineById'] = this.getWineById!.toJson();
    }
    return data;
  }
}

class GetWineById {
  bool? status;
  String? message;
  GetWineByIdData? data;

  GetWineById({this.status, this.message, this.data});

  GetWineById.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new GetWineByIdData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetWineByIdData {
  int? id;
  String? wineName;
  String? wineType;
  int? age;
  int? price;
  String? tags;
  String? description;
  String? image;

  GetWineByIdData(
      {this.id,
        this.wineName,
        this.wineType,
        this.age,
        this.price,
        this.tags,
        this.description,
        this.image});

  GetWineByIdData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineName = json['wineName'];
    wineType = json['wineType'];
    age = json['age'];
    price = json['price'];
    tags = json['tags'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wineName'] = this.wineName;
    data['wineType'] = this.wineType;
    data['age'] = this.age;
    data['price'] = this.price;
    data['tags'] = this.tags;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}