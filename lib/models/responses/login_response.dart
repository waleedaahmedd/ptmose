class LoginResponse {
  String? userName;
  String? password;

  LoginResponse({this.userName, this.password});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    password = json['password'];
  }

}