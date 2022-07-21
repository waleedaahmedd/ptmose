class WineDetailRequest {

  final int wineId;


  WineDetailRequest(this.wineId);


  generateQuery(){
    String query = '''{"query":"query {\\r\\n  getWineById(id: $wineId) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      id\\r\\n      wineName\\r\\n      wineType\\r\\n      age\\r\\n      price\\r\\n      tags\\r\\n      description\\r\\n      image\\r\\n    }\\r\\n  }\\r\\n}","variables":{}}''';
    return query;
  }
}