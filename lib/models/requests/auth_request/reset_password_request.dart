class ResetPasswordRequest {
  final String email;
  final String newPassword;

  ResetPasswordRequest({required this.email, required this.newPassword});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$email: String!, \$newPassword: String!) {\\r\\n  resetPassword(email: \$email, newPassword: \$newPassword) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"email":"$email","newPassword":"$newPassword"}}''';
    return query;
  }
}
