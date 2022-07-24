import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ptmose/models/requests/auth_request/sign_up_request.dart';
import 'package:ptmose/models/requests/tastings_details_request.dart';
import 'package:ptmose/models/requests/wineries_list_by_location_request.dart';
import 'package:ptmose/models/responses/auth_response/sign_up_response.dart';
import 'package:ptmose/models/responses/tastings_details_response.dart';
import 'package:ptmose/models/responses/wineries_list_by_location_reaponse.dart';

import '../models/orderItemModel.dart';
import '../models/requests/location_request.dart';
import '../models/requests/auth_request/login_request.dart';
import '../models/requests/reserve_tasting_request.dart';
import '../models/requests/submit_order_request.dart';
import '../models/requests/tastings_list_by_location_request.dart';
import '../models/requests/user_reservations_request.dart';
import '../models/requests/wine_detail_request.dart';
import '../models/requests/wineries_and_testing_request.dart';
import '../models/requests/wineries_details_request.dart';
import '../models/requests/wines_list_request.dart';
import '../models/responses/auth_response/login_response.dart';
import '../models/responses/locations_model.dart';
import '../models/responses/reserve_tasting_response.dart';
import '../models/responses/submit_order_response.dart';
import '../models/responses/tasting_list_by_location_reaponse.dart';
import '../models/responses/user_reservation_response.dart';
import '../models/responses/wine_detail_response.dart';
import '../models/responses/wineries_and_testing_response.dart';
import '../models/responses/wineries_detail_response.dart';
import '../models/responses/wines_list_response.dart';

var _baseURL = 'https://ptmose.herokuapp.com/';
var headers = {'Content-Type': 'application/json'};

Future<LoginResponse?> loginApi(LoginRequest loginRequest) async {
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

Future<WineriesAndTestingResponse?> getWineriesAndTastings(
    int? locationId) async {
  WineriesAndTastingsRequest wineriesAndLocationRequest =
      WineriesAndTastingsRequest(locationId!);
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

Future<WineriesDetailsResponse?> getWineryDetails(int? wineryId) async {
  WineriesDetailRequest wineriesDetailRequest =
      WineriesDetailRequest(wineryId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = wineriesDetailRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    WineriesDetailsResponse wineriesDetailsResponse =
        WineriesDetailsResponse.fromJson(json.decode(responseData.body));

    return wineriesDetailsResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<TastingsDetailResponse?> getTastingsDetails(int? tastingId) async {
  TastingsDetailsRequest tastingsDetailsRequest =
      TastingsDetailsRequest(tastingId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = tastingsDetailsRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    TastingsDetailResponse tastingsDetailResponse =
        TastingsDetailResponse.fromJson(json.decode(responseData.body));

    return tastingsDetailResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<WineDetailResponse?> getWineDetails(int? wineId) async {
  WineDetailRequest wineDetailRequest =
  WineDetailRequest(wineId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = wineDetailRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    WineDetailResponse wineDetailResponse =
    WineDetailResponse.fromJson(json.decode(responseData.body));

    return wineDetailResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<WinesListResponse?> getWinesList() async {
  WinesListRequest winesListRequest = WinesListRequest();
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = winesListRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    WinesListResponse winesListResponse =
    WinesListResponse.fromJson(json.decode(responseData.body));

    return winesListResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<ReserveTastingResponse?> reserveTasting(int? tastingId , int? userId) async {
  ReserveTastingRequest reserveTastingRequest = ReserveTastingRequest(tastingId!,userId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = reserveTastingRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    ReserveTastingResponse reserveTastingResponse =
    ReserveTastingResponse.fromJson(json.decode(responseData.body));

    return reserveTastingResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<SubmitOrderResponse?> submitOrder( int? userId, int? totalAmount, List<OrderItemModel> orderItemModel,) async {
  String cartItems = jsonEncode(orderItemModel);
  SubmitOrderRequest submitOrderRequest = SubmitOrderRequest(userId!,cartItems,'',totalAmount!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = submitOrderRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    SubmitOrderResponse submitOrderResponse =
    SubmitOrderResponse.fromJson(json.decode(responseData.body));

    return submitOrderResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}


Future<UserReservationResponse?> getReservations(int? userId) async {
  UserReservationsRequest reservationsRequest = UserReservationsRequest(userId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = reservationsRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    UserReservationResponse reservationResponse =
    UserReservationResponse.fromJson(json.decode(responseData.body));

    return reservationResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<WineriesListByLocationResponse?> getAllWineriesListByLocation(
    int? locationId) async {
  WineriesListByLocationRequest wineriesListByLocationRequest =
      WineriesListByLocationRequest(locationId!);
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = wineriesListByLocationRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    WineriesListByLocationResponse wineriesListByLocationResponse =
        WineriesListByLocationResponse.fromJson(json.decode(responseData.body));

    return wineriesListByLocationResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}

Future<TastingListByLocationResponse?> getAllTastingListByLocation(int? locationId) async {
  TastingListByLocationRequest tastingListByLocationRequest = TastingListByLocationRequest(locationId!);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(_baseURL));
  request.body = tastingListByLocationRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    TastingListByLocationResponse tastingListByLocationResponse =
    TastingListByLocationResponse.fromJson(json.decode(responseData.body));

    return tastingListByLocationResponse;
  } else {
    print(response.reasonPhrase);
    return null;
  }
}
