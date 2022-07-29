class WineDetailResponse {
  WineDetailResponseData? data;

  WineDetailResponse({this.data});

  WineDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? WineDetailResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
        ? GetWineById.fromJson(json['getWineById'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getWineById != null) {
      data['getWineById'] = getWineById!.toJson();
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
    data = json['data'] != null ? GetWineByIdData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetWineByIdData {
  Wineries? wineries;
  int? id;
  String? wineName;
  String? wineType;
  int? age;
  int? price;
  String? tags;
  String? description;
  String? image;

  GetWineByIdData(
      {this.wineries,
        this.id,
        this.wineName,
        this.wineType,
        this.age,
        this.price,
        this.tags,
        this.description,
        this.image});

  GetWineByIdData.fromJson(Map<String, dynamic> json) {
    wineries = json['Wineries'] != null
        ? Wineries.fromJson(json['Wineries'])
        : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wineries != null) {
      data['Wineries'] = wineries!.toJson();
    }
    data['id'] = id;
    data['wineName'] = wineName;
    data['wineType'] = wineType;
    data['age'] = age;
    data['price'] = price;
    data['tags'] = tags;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

class Wineries {
  String? wineryName;

  Wineries({this.wineryName});

  Wineries.fromJson(Map<String, dynamic> json) {
    wineryName = json['wineryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wineryName'] = wineryName;
    return data;
  }
}