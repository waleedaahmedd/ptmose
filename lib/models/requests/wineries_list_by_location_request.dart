class WineriesListByLocationRequest {
  final int locationId;

  WineriesListByLocationRequest(this.locationId);


  generateQuery(){
    String query = '''{"query":"query GetWineryById(\$getWineryInput: GetWineryInput) {\\r\\n  getAllWineries(GetWineryInput: \$getWineryInput) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      wineryName\\r\\n      wineryAbout\\r\\n      wineryTags\\r\\n      wineryImage\\r\\n      startTime\\r\\n      endTime\\r\\n    }\\r\\n  }\\r\\n}\\r\\n","variables":{"getWineryInput":{"locationId":$locationId}}}''';
    return query;
  }
}