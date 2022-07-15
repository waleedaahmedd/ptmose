class LocationRequest {

  generateQuery(){
    String query = '''{"query":"query GetAllLocations {\\n   getAllLocations {\\n    status\\n    message\\n    data {\\n      id\\n      name\\n      img\\n      createdAt\\n      updatedAt\\n    }\\n  }\\n}","variables":{}}''';
    return query;
  }
}