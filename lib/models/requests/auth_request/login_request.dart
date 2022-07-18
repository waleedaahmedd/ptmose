class LoginRequest {
  final String email;
  final String? password;

  LoginRequest(this.email, this.password);

  generateQuery() {
    String query =
        '''{"query":"query {\\n  loginUser(email: \\"$email\\", password: \\"$password\\", userRole: User,) {\\n    status\\n    message\\n    data {\\n      id\\n      name\\n      email\\n      isVerified\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}
