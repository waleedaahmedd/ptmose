class ForgetPasswordEmailRequest {
  final String email;

  ForgetPasswordEmailRequest({required this.email});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$email: String!) {\\r\\n  forgotPassword(email: \$email) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"email":"$email"}}''';
    return query;
  }
}
