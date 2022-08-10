class StripePaymentResponse {
  StripePaymentResponseData? data;

  StripePaymentResponse({this.data});

  StripePaymentResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? StripePaymentResponseData.fromJson(json['data'])
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

class StripePaymentResponseData {
  CreatePaymentIntent? createPaymentIntent;

  StripePaymentResponseData({this.createPaymentIntent});

  StripePaymentResponseData.fromJson(Map<String, dynamic> json) {
    createPaymentIntent = json['createPaymentIntent'] != null
        ? CreatePaymentIntent.fromJson(json['createPaymentIntent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createPaymentIntent != null) {
      data['createPaymentIntent'] = createPaymentIntent!.toJson();
    }
    return data;
  }
}

class CreatePaymentIntent {
  bool? status;
  String? message;
  CreatePaymentIntentData? data;

  CreatePaymentIntent({this.status, this.message, this.data});

  CreatePaymentIntent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? CreatePaymentIntentData.fromJson(json['data'])
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

class CreatePaymentIntentData {
  String? paymentIntentId;
  String? stripeCustomerId;
  String? clientSecret;

  CreatePaymentIntentData(
      {this.paymentIntentId, this.stripeCustomerId, this.clientSecret});

  CreatePaymentIntentData.fromJson(Map<String, dynamic> json) {
    paymentIntentId = json['paymentIntentId'];
    stripeCustomerId = json['stripeCustomerId'];
    clientSecret = json['client_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentIntentId'] = paymentIntentId;
    data['stripeCustomerId'] = stripeCustomerId;
    data['client_secret'] = clientSecret;
    return data;
  }
}
