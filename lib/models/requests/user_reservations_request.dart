class UserReservationsRequest {
  final int userId;

  UserReservationsRequest(this.userId);

  generateQuery() {
    String query =
    '''{"query":"query(\$getReservationInput: GetReservationInput) {\\r\\n  getAllReservation(GetReservationInput: \$getReservationInput) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      status\\r\\n      Tasting {\\r\\n        id\\r\\n        img\\r\\n        date\\r\\n        startTime\\r\\n        endTime\\r\\n        tastingName\\r\\n        merchantName\\r\\n        locationName\\r\\n      }\\r\\n    }\\r\\n  }\\r\\n}","variables":{"getReservationInput":{"userId":$userId}}}''';
    return query;
  }
}