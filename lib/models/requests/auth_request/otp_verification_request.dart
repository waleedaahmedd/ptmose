class OtpVerificationRequest {
  final String email;
  final String otp;

  OtpVerificationRequest({required this.email, required this.otp});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$token: String!, \$email: String!) {\\r\\n  verifyOtp(token: \$token, email: \$email) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      name\\r\\n      email\\r\\n      isVerified\\r\\n    }\\r\\n  }\\r\\n}","variables":{"token":"$otp","email":"$email"}}''';
    return query;
  }
}
