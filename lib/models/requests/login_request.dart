class LoginRequest {
  String? userName;
  String? password;

  LoginRequest({this.userName, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}