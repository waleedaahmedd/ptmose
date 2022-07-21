class ReserveTastingRequest {
  final int tastingId;
  final int userId;

  ReserveTastingRequest(this.tastingId,this.userId);

  generateQuery() {
    String query =
    '''{"query":"mutation {\\r\\n  addReservers(tastingId: $tastingId, userId: $userId, partySize: 1) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{}}''';
    return query;
  }
}
