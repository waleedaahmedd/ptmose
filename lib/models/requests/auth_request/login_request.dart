class LoginRequest {

  final String email;
  final String? password;

  LoginRequest(this.email, this.password);

  generateQuery(){
     String query = '''{"query":"query {\\n  loginUser(email: \\"$email\\", password: \\"$password\\") {\\n  data {\\n    id\\n    email\\n    name\\n    userRole\\n    createdAt\\n  }\\n  message\\n  status\\n  }\\n}","variables":{}}''';
  return query;
  }
}