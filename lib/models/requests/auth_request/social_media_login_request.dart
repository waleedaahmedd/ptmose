class SocialMediaLoginRequest {
  final String email;
  final String name;
  final String fcmToken;
  final String providerId;
  final String registrationType;



  //emailpassword/facebook/google

  SocialMediaLoginRequest({required this.email, required this.providerId, required this.name, required this.fcmToken, required this.registrationType});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$providerId: String!, \$registrationType: String!, \$userRole: Role!, \$fcmToken: String, \$email: String, \$name: String) {\\r\\n  socialMediaLogin(providerId: \$providerId, registrationType: \$registrationType, userRole: \$userRole, fcmToken: \$fcmToken, email: \$email, name: \$name) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      email\\r\\n      name\\r\\n      isVerified\\r\\n    }\\r\\n  }\\r\\n}\\r\\n","variables":{"providerId":"$providerId","registrationType":"$registrationType","userRole":"User","fcmToken":"$fcmToken","email":"$email","name":"$name"}}''';
    return query;
  }
}