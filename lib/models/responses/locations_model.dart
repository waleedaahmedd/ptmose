class LocationsModel {
  LocationsList? data;

  LocationsModel({this.data});

  LocationsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? LocationsList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LocationsList {
  GetAllLocations? getAllLocations;

  LocationsList({this.getAllLocations});

  LocationsList.fromJson(Map<String, dynamic> json) {
    getAllLocations = json['getAllLocations'] != null
        ? GetAllLocations.fromJson(json['getAllLocations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllLocations != null) {
      data['getAllLocations'] = getAllLocations!.toJson();
    }
    return data;
  }
}

class GetAllLocations {
  bool? status;
  String? message;
  List<LocationData>? data;

  GetAllLocations({this.status, this.message, this.data});

  GetAllLocations.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LocationData>[];
      json['data'].forEach((v) {
        data!.add(LocationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationData {
  int? id;
  String? name;
  String? img;
  String? createdAt;
  String? updatedAt;

  LocationData({this.id, this.name, this.img, this.createdAt, this.updatedAt});

  LocationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}