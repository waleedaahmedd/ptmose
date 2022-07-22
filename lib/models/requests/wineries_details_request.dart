class WineriesDetailRequest {
  final int wineryId;

  WineriesDetailRequest(this.wineryId);


  generateQuery(){
    String query = '''{"query":"query {\\r\\n  getWineryById(id: $wineryId) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      wineryName\\r\\n      wineryAbout\\r\\n      wineryImage\\r\\n      startTime\\r\\n      endTime\\r\\n      address\\r\\n      Tasting {\\r\\n        id\\r\\n        img\\r\\n        date\\r\\n        startTime\\r\\n        endTime\\r\\n        tastingName\\r\\n        merchantName\\r\\n        locationName\\r\\n      }\\r\\n      Wine {\\r\\n        id\\r\\n        age\\r\\n        wineName\\r\\n        wineType\\r\\n        price\\r\\n        image\\r\\n      }\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';
    return query;
  }
}