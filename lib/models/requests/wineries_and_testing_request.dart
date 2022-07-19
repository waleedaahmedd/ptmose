class WineriesAndTastingsRequest {
  final int locationId;

  WineriesAndTastingsRequest(this.locationId);


  generateQuery(){
    String query = '''{"query":"query {\\n  getWineryByLocation(id: $locationId) {\\n    status\\n    message\\n    data {\\n      tastings {\\n        id\\n        img\\n        date\\n        startTime\\n        endTime\\n        tastingName\\n        merchantName\\n        locationName\\n      }\\n      wineries {\\n        id\\n        wineryName\\n        wineryAbout\\n        wineryTags\\n                startTime\\n                endTime\\n        wineryImage\\n      }\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}