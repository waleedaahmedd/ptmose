import '../../utils/date_time_formatter.dart';
import 'wines_response.dart';

class TastingsDetailResponse {
  TastingsDetailData? data;

  TastingsDetailResponse({this.data});

  TastingsDetailResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TastingsDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TastingsDetailData {
  GetTastingById? getTastingById;

  TastingsDetailData({this.getTastingById});

  TastingsDetailData.fromJson(Map<String, dynamic> json) {
    getTastingById = json['getTastingById'] != null
        ? GetTastingById.fromJson(json['getTastingById'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getTastingById != null) {
      data['getTastingById'] = getTastingById!.toJson();
    }
    return data;
  }
}

class GetTastingById {
  bool? status;
  String? message;
  GetTastingByIdData? data;

  GetTastingById({this.status, this.message, this.data});

  GetTastingById.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? GetTastingByIdData.fromJson(json['data']) : null;
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

class GetTastingByIdData {
  int? id;
  int? wineryId;
  String? img;
  String? date;
  String? startTime;
  String? endTime;
  String? tastingName;
  String? merchantName;
  String? locationName;
  List<TastingReservers>? tastingReservers;
  List<TastingWines>? tastingWines;
  String? about;

  GetTastingByIdData(
      {this.id,
        this.wineryId,
        this.img,
        this.date,
        this.startTime,
        this.endTime,
        this.tastingName,
        this.merchantName,
        this.locationName,
        this.tastingReservers,
        this.tastingWines,
        this.about});

  GetTastingByIdData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wineryId = json['wineryId'];
    img = json['img'];
    date = DateTimeFormatter.showDate(json['date']);
    startTime = DateTimeFormatter.showTime(json['startTime']);
    endTime = DateTimeFormatter.showTime(json['endTime']);
    tastingName = json['tastingName'];
    merchantName = json['merchantName'];
    locationName = json['locationName'];
    if (json['TastingReservers'] != null) {
      tastingReservers = <TastingReservers>[];
      json['TastingReservers'].forEach((v) {
        tastingReservers!.add(TastingReservers.fromJson(v));
      });
    }
    if (json['tastingWines'] != null) {
      tastingWines = <TastingWines>[];
      json['tastingWines'].forEach((v) {
        tastingWines!.add(TastingWines.fromJson(v));
      });
    }
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wineryId'] = wineryId;
    data['img'] = img;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['tastingName'] = tastingName;
    data['merchantName'] = merchantName;
    data['locationName'] = locationName;
    if (tastingReservers != null) {
      data['TastingReservers'] =
          tastingReservers!.map((v) => v.toJson()).toList();
    }
    if (tastingWines != null) {
      data['tastingWines'] = tastingWines!.map((v) => v.toJson()).toList();
    }
    data['about'] = about;
    return data;
  }
}

class TastingReservers {
  int? id;

  TastingReservers({this.id});

  TastingReservers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class TastingWines {
  Wine? wine;

  TastingWines({this.wine});

  TastingWines.fromJson(Map<String, dynamic> json) {
    wine = json['Wine'] != null ? Wine.fromJson(json['Wine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wine != null) {
      data['Wine'] = wine!.toJson();
    }
    return data;
  }
}

