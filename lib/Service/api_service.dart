import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ptmose/models/requests/auth_request/sign_up_request.dart';
import 'package:ptmose/models/responses/auth_response/sign_up_response.dart';

import '../models/requests/location_request.dart';
import '../models/requests/auth_request/login_request.dart';
import '../models/requests/wineries_and_testing_request.dart';
import '../models/responses/auth_response/login_response.dart';
import '../models/responses/locations_model.dart';
import '../models/responses/wineries_and_testing_response.dart';

var _baseURL = 'https://ptmose.herokuapp.com/';

Future<LoginResponse?> loginApi(LoginRequest loginRequest) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(_baseURL));
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
}

Future<SignUpResponse?> signUpApi(SignUpRequest signUpRequest) async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(_baseURL));
  request.body = signUpRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    SignUpResponse signUpResponse =
    SignUpResponse.fromJson(json.decode(responseData.body));

    return signUpResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<LocationsModel?> getAllLocationsApi() async {
  LocationRequest locationRequest = LocationRequest();
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(_baseURL));
  request.body = locationRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    LocationsModel locationResponse =
    LocationsModel.fromJson(json.decode(responseData.body));

    return locationResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<WineriesAndTestingResponse?> getWineriesAndTastings(int? locationId) async {
  WineriesAndLocationRequest wineriesAndLocationRequest = WineriesAndLocationRequest(locationId!);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(_baseURL));
  request.body = wineriesAndLocationRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    WineriesAndTestingResponse wineriesAndTestingResponse =
    WineriesAndTestingResponse.fromJson(json.decode(responseData.body));

    return wineriesAndTestingResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
