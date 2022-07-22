
class UserDataResponse {
  int? id;
  String? name;
  String? email;
  bool? isVerified;

  UserDataResponse(
      {this.id,
        this.name,
        this.email,
        this.isVerified,
        });

  UserDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['isVerified'] = isVerified;
    return data;
  }
}