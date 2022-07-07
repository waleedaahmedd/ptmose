class LoginRequest {

  final String email;
  final String? password;

  LoginRequest(this.email, this.password);

  generateQuery(){
     String query = '''{"query":"query {\\n  loginUser(email: \\"$email\\", password: \\"$password\\") {\\n    status\\n    message\\n    data {\\n      id\\n      email\\n      firstName\\n    }\\n  }\\n}\\n","variables":{}}''';
  return query;
  }
}