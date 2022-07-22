class TastingListByLocationRequest {
  final int locationId;

  TastingListByLocationRequest(this.locationId);


  generateQuery(){
    String query = '''{"query":"query(\$getTastingInput: GetTastingInput) {\\r\\n  getAllTastings(GetTastingInput: \$getTastingInput) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      img\\r\\n      date\\r\\n      startTime\\r\\n      endTime\\r\\n      tastingName\\r\\n      merchantName\\r\\n      locationName\\r\\n    }\\r\\n  }\\r\\n}\\r\\n","variables":{"getTastingInput":{"Wineries":{"locationId":$locationId}}}}''';
    return query;
  }
}