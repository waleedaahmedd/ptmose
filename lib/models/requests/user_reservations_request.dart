class UserReservationsRequest {
  final int userId;

  UserReservationsRequest(this.userId);

  generateQuery() {
    String query =
    '''{"query":"query(\$getReservationInput: GetReservationInput) {\\r\\n  getAllReservation(GetReservationInput: \$getReservationInput) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      Tasting {\\r\\n        id\\r\\n        tastingName\\r\\n        merchantName\\r\\n        img\\r\\n        date\\r\\n        startTime\\r\\n        endTime\\r\\n        locationName\\r\\n        TastingReservers {\\r\\n          status\\r\\n        }\\r\\n      }\\r\\n    }\\r\\n  }\\r\\n}","variables":{"getReservationInput":{"userId":$userId}}}''';
    return query;
  }
}