class SignUpRequest {
  final String email;
  final String name;
  final String? password;
  final String? fcmToken;
  final String? providerId;
  final String? registrationType;

  //emailpassword/facebook/google

  SignUpRequest(this.email, this.password, this.name, this.fcmToken,
      this.providerId, this.registrationType);

  generateQuery() {
    String query =
        '''{"query":"mutation {\\n  createUser(email: \\"$email\\", name: \\"$name\\", password: \\"$password\\", userRole: User, fcmToken: \\"$fcmToken\\", providerId: \\"$providerId\\", registrationType: \\"$registrationType\\") {\\n    status\\n    message    \\n     data {\\n      id\\n      name\\n      email\\n      isVerified\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}
