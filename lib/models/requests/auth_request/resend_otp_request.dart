class ResendOtpRequest {
  final String email;

  ResendOtpRequest({required this.email});

  generateQuery() {
    String query =
    '''{"query":"mutation ResendOtp(\$email: String!) {\\r\\n  resendOtp(email: \$email) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"email":"$email"}}''';
    return query;
  }
}
