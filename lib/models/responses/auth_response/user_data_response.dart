class UserDataResponse {
  String? id;
  String? email;
  String? name;
  String? userRole;
  String? createdAt;

  UserDataResponse({this.id, this.email, this.name, this.userRole, this.createdAt});

  UserDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    userRole = json['userRole'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['userRole'] = this.userRole;
    data['createdAt'] = this.createdAt;
    return data;
  }
}