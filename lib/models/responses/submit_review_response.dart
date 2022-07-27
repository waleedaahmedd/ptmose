class SubmitReviewResponse {
  SubmitReviewResponseData? data;

  SubmitReviewResponse({this.data});

  SubmitReviewResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SubmitReviewResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SubmitReviewResponseData {
  AddFeedback? addFeedback;

  SubmitReviewResponseData({this.addFeedback});

  SubmitReviewResponseData.fromJson(Map<String, dynamic> json) {
    addFeedback = json['addFeedback'] != null
        ? new AddFeedback.fromJson(json['addFeedback'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addFeedback != null) {
      data['addFeedback'] = this.addFeedback!.toJson();
    }
    return data;
  }
}

class AddFeedback {
  bool? status;
  String? message;

  AddFeedback({this.status, this.message});

  AddFeedback.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}