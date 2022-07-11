class SignUpRequest {

  final String email;
  final String name;
  final String? password;

  SignUpRequest(this.email, this.password, this.name);

  generateQuery(){
    String query = '''{"query":"mutation {\\n  createUser(email: \\"$email\\", name: \\"$name\\", password: \\"$password\\", userRole: User) {\\n    status\\n    message\\n    data {\\n        id\\n        email\\n        name\\n        userRole\\n        createdAt\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}