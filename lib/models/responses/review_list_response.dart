import 'Wines_response.dart';

class ReviewListResponse {
  ReviewListResponseData? data;

  ReviewListResponse({this.data});

  ReviewListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ReviewListResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ReviewListResponseData {
  GetAllFeedbacks? getAllFeedbacks;

  ReviewListResponseData({this.getAllFeedbacks});

  ReviewListResponseData.fromJson(Map<String, dynamic> json) {
    getAllFeedbacks = json['getAllFeedbacks'] != null
        ? GetAllFeedbacks.fromJson(json['getAllFeedbacks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllFeedbacks != null) {
      data['getAllFeedbacks'] = getAllFeedbacks!.toJson();
    }
    return data;
  }
}

class GetAllFeedbacks {
  bool? status;
  String? message;
  List<GetAllFeedbacksData>? data;

  GetAllFeedbacks({this.status, this.message, this.data});

  GetAllFeedbacks.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllFeedbacksData>[];
      json['data'].forEach((v) {
        data!.add(GetAllFeedbacksData.fromJson(v));
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

class GetAllFeedbacksData {
  int? fruitForward;
  int? berrys;
  int? fullBodied;
  int? thin;
  int? longFinish;
  int? bakance;
  int? complex;
  int? elegant;
  int? chewy;
  int? soft;
  int? silky;
  int? burn;
  int? jammy;
  int? bellPepper;
  int? spicy;
  int? toasty;
  int? oak;
  int? vegetable;
  int? minerality;
  int? rubber;
  int? smoky;
  int? ageOfWine;
  String? comment;
  Wine? wine;

  GetAllFeedbacksData(
      {this.fruitForward,
        this.berrys,
        this.fullBodied,
        this.thin,
        this.longFinish,
        this.bakance,
        this.complex,
        this.elegant,
        this.chewy,
        this.soft,
        this.silky,
        this.burn,
        this.jammy,
        this.bellPepper,
        this.spicy,
        this.toasty,
        this.oak,
        this.vegetable,
        this.minerality,
        this.rubber,
        this.smoky,
        this.ageOfWine,
        this.comment,
        this.wine});

  GetAllFeedbacksData.fromJson(Map<String, dynamic> json) {
    fruitForward = json['fruitForward'];
    berrys = json['berrys'];
    fullBodied = json['fullBodied'];
    thin = json['thin'];
    longFinish = json['longFinish'];
    bakance = json['bakance'];
    complex = json['complex'];
    elegant = json['elegant'];
    chewy = json['chewy'];
    soft = json['soft'];
    silky = json['silky'];
    burn = json['burn'];
    jammy = json['jammy'];
    bellPepper = json['bellPepper'];
    spicy = json['spicy'];
    toasty = json['toasty'];
    oak = json['oak'];
    vegetable = json['vegetable'];
    minerality = json['minerality'];
    rubber = json['rubber'];
    smoky = json['smoky'];
    ageOfWine = json['ageOfWine'];
    comment = json['comment'];
    wine = json['Wine'] != null ? Wine.fromJson(json['Wine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fruitForward'] = fruitForward;
    data['berrys'] = berrys;
    data['fullBodied'] = fullBodied;
    data['thin'] = thin;
    data['longFinish'] = longFinish;
    data['bakance'] = bakance;
    data['complex'] = complex;
    data['elegant'] = elegant;
    data['chewy'] = chewy;
    data['soft'] = soft;
    data['silky'] = silky;
    data['burn'] = burn;
    data['jammy'] = jammy;
    data['bellPepper'] = bellPepper;
    data['spicy'] = spicy;
    data['toasty'] = toasty;
    data['oak'] = oak;
    data['vegetable'] = vegetable;
    data['minerality'] = minerality;
    data['rubber'] = rubber;
    data['smoky'] = smoky;
    data['ageOfWine'] = ageOfWine;
    data['comment'] = comment;
    if (wine != null) {
      data['Wine'] = wine!.toJson();
    }
    return data;
  }
}

