class TastingsDetailsRequest {
  final int tastingId;

  TastingsDetailsRequest(this.tastingId);


  generateQuery(){
    String query = '''{"query":"query {\\r\\n  getTastingById(id: $tastingId) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      img\\r\\n      date\\r\\n      startTime\\r\\n      endTime\\r\\n      tastingName\\r\\n      merchantName\\r\\n      locationName\\r\\n      TastingReservers {\\r\\n        id\\r\\n      }\\r\\n      tastingWines {\\r\\n        Wine {\\r\\n          id\\r\\n          wineName\\r\\n          age\\r\\n          price\\r\\n          wineType\\r\\n          image\\r\\n        }\\r\\n      }\\r\\n      about\\r\\n    }\\r\\n  }\\r\\n}\\r\\n","variables":{}}''';
    return query;
  }
}