class SignUpRequest {
  final String email;
  final String name;
  final String password;
  final String fcmToken;

  //emailpassword/facebook/google

  SignUpRequest({required this.email, required this.password, required this.name, required this.fcmToken});

  generateQuery() {
    String query =
        '''{"query":"mutation {\\n  createUser(email: \\"$email\\", name: \\"$name\\", password: \\"$password\\", userRole: User, fcmToken: \\"$fcmToken\\") {\\n    status\\n    message    \\n     data {\\n      id\\n      name\\n      email\\n      isVerified\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}
