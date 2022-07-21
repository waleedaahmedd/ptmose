class ReserveTastingResponse {
  ReserveTastingResponseData? data;

  ReserveTastingResponse({this.data});

  ReserveTastingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ReserveTastingResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ReserveTastingResponseData {
  AddReservers? addReservers;

  ReserveTastingResponseData({this.addReservers});

  ReserveTastingResponseData.fromJson(Map<String, dynamic> json) {
    addReservers = json['addReservers'] != null
        ? AddReservers.fromJson(json['addReservers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addReservers != null) {
      data['addReservers'] = addReservers!.toJson();
    }
    return data;
  }
}

class AddReservers {
  bool? status;
  String? message;

  AddReservers({this.status, this.message});

  AddReservers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}