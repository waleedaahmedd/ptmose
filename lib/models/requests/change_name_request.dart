class ChangeNameRequest {
  final String name;
  final int userId;

  ChangeNameRequest({required this.name, required this.userId});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$updateProfileId: Int!, \$name: String, \$userRole: Role!) {\\r\\n  updateProfile(id: \$updateProfileId, name: \$name, userRole: \$userRole) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"updateProfileId":$userId,"name":"$name","userRole":"User"}}''';
    return query;
  }
}