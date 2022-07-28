class LoginRequest {
  final String email;
  final String password;
  final String fcmToken;

  LoginRequest({required this.email, required this.password, required this.fcmToken});

  generateQuery() {
    String query =
        '''{"query":"query {\\n  loginUser(email: \\"$email\\", password: \\"$password\\", userRole: User, fcmToken: \\"$fcmToken\\") {\\n    status\\n    message\\n    data {\\n      id\\n      name\\n      email\\n      isVerified\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}
