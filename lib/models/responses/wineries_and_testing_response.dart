class WineriesAndTestingResponse {
  WineriesAndTestingData? data;

  WineriesAndTestingResponse({this.data});

  WineriesAndTestingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? WineriesAndTestingData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WineriesAndTestingData {
  GetWineryByLocation? getWineryByLocation;

  WineriesAndTestingData({this.getWineryByLocation});

  WineriesAndTestingData.fromJson(Map<String, dynamic> json) {
    getWineryByLocation = json['getWineryByLocation'] != null
        ? GetWineryByLocation.fromJson(json['getWineryByLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getWineryByLocation != null) {
      data['getWineryByLocation'] = getWineryByLocation!.toJson();
    }
    return data;
  }
}

class GetWineryByLocation {
  bool? status;
  String? message;
  WineryByLocationData? data;

  GetWineryByLocation({this.status, this.message, this.data});

  GetWineryByLocation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? WineryByLocationData.fromJson(json['data'])
        : null;
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

class WineryByLocationData {
  List<Tastings>? tastings;
  List<Wineries>? wineries;

  WineryByLocationData({this.tastings, this.wineries});

  WineryByLocationData.fromJson(Map<String, dynamic> json) {
    if (json['tastings'] != null) {
      tastings = <Tastings>[];
      json['tastings'].forEach((v) {
        tastings!.add(Tastings.fromJson(v));
      });
    }
    if (json['wineries'] != null) {
      wineries = <Wineries>[];
      json['wineries'].forEach((v) {
        wineries!.add(Wineries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tastings != null) {
      data['tastings'] = tastings!.map((v) => v.toJson()).toList();
    }
    if (wineries != null) {
      data['wineries'] = wineries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tastings {
  int? id;
  String? img;
  String? date;
  String? startTime;
  String? endTime;
  String? tastingName;
  String? merchantName;
  String? locationName;

  Tastings(
      {this.id,
        this.img,
        this.date,
        this.startTime,
        this.endTime,
        this.tastingName,
        this.merchantName,
        this.locationName});

  Tastings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    tastingName = json['tastingName'];
    merchantName = json['merchantName'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img'] = this.img;
    data['date'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['tastingName'] = this.tastingName;
    data['merchantName'] = this.merchantName;
    data['locationName'] = this.locationName;
    return data;
  }
}

class Wineries {
  int? id;
  String? wineryName;
  String? wineryAbout;
  String? wineryTags;
  String? wineryImage;

  Wineries(
      {this.id,
      this.wineryName,
      this.wineryAbout,
      this.wineryTags,
      this.wineryImage});

  Wineries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineryName = json['wineryName'];
    wineryAbout = json['wineryAbout'];
    wineryTags = json['wineryTags'];
    wineryImage = json['wineryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wineryName'] = wineryName;
    data['wineryAbout'] = wineryAbout;
    data['wineryTags'] = wineryTags;
    data['wineryImage'] = wineryImage;
    return data;
  }
}
