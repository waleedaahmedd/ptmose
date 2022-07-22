import 'package:ptmose/models/responses/tastings_response.dart';

class UserReservationResponse {
  UserReservationResponseData? data;

  UserReservationResponse({this.data});

  UserReservationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserReservationResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserReservationResponseData {
  GetAllReservation? getAllReservation;

  UserReservationResponseData({this.getAllReservation});

  UserReservationResponseData.fromJson(Map<String, dynamic> json) {
    getAllReservation = json['getAllReservation'] != null
        ? GetAllReservation.fromJson(json['getAllReservation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllReservation != null) {
      data['getAllReservation'] = getAllReservation!.toJson();
    }
    return data;
  }
}

class GetAllReservation {
  bool? status;
  String? message;
  List<ReservationData>? data;

  GetAllReservation({this.status, this.message, this.data});

  GetAllReservation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReservationData>[];
      json['data'].forEach((v) {
        data!.add(ReservationData.fromJson(v));
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

class ReservationData {
  String? status;
  Tastings? tasting;

  ReservationData({this.status, this.tasting});

  ReservationData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    tasting =
    json['Tasting'] != null ? Tastings.fromJson(json['Tasting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (tasting != null) {
      data['Tasting'] = tasting!.toJson();
    }
    return data;
  }
}

