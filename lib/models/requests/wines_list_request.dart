class WinesListRequest {

  WinesListRequest();


  generateQuery(){
    String query = '''{"query":"query {\\r\\n  getAllWines {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      wineName\\r\\n      age\\r\\n      price\\r\\n      image\\r\\n      wineType\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';
    return query;
  }
}