class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;
  final int userId;

  ChangePasswordRequest({required this.currentPassword, required this.userId, required this.newPassword});

  generateQuery() {
    String query =
    '''{"query":"mutation ChangePassword(\$changePasswordId: Int!, \$currentPassword: String!, \$newPassword: String!) {\\r\\n  changePassword(id: \$changePasswordId, currentPassword: \$currentPassword, newPassword: \$newPassword) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"changePasswordId":$userId,"currentPassword":"$currentPassword","newPassword":"$newPassword"}}''';
    return query;
  }
}