class SubmitOrderResponse {
  SubmitOrderResponseData? data;

  SubmitOrderResponse({this.data});

  SubmitOrderResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? SubmitOrderResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubmitOrderResponseData {
  CreateOrder? createOrder;

  SubmitOrderResponseData({this.createOrder});

  SubmitOrderResponseData.fromJson(Map<String, dynamic> json) {
    createOrder = json['createOrder'] != null
        ? CreateOrder.fromJson(json['createOrder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createOrder != null) {
      data['createOrder'] = createOrder!.toJson();
    }
    return data;
  }
}

class CreateOrder {
  bool? status;
  String? message;

  CreateOrder({this.status, this.message});

  CreateOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}