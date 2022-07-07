import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/requests/login_request.dart';
import '../models/requests/post.dart';
import '../models/responses/login_response.dart';

var _baseURL = 'https://howmuchbackend.herokuapp.com/';

Future<LoginResponse?> callGraphApi(LoginRequest loginRequest) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('${_baseURL}graphql'));
  request.body = loginRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    LoginResponse loginResponse =
        LoginResponse.fromJson(json.decode(responseData.body));

    return loginResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }

/*
  if (response.statusCode == 200) {
    final sex = await http.Response.fromStream(response);
    print(sex.body);

    return sex.body;
  } else {
    print(response.reasonPhrase);

    return null;
  }*/
}
