import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:ptmose/models/requests/auth_request/sign_up_request.dart';
import 'package:ptmose/models/requests/change_name_request.dart';
import 'package:ptmose/models/requests/payment_request.dart';
import 'package:ptmose/models/requests/review_list_request.dart';
import 'package:ptmose/models/requests/tastings_details_request.dart';
import 'package:ptmose/models/requests/wineries_list_by_location_request.dart';
import 'package:ptmose/models/responses/auth_response/sign_up_response.dart';
import 'package:ptmose/models/responses/change_password_response.dart';
import 'package:ptmose/models/responses/payment_response.dart';
import 'package:ptmose/models/responses/review_list_response.dart';
import 'package:ptmose/models/responses/tastings_details_response.dart';
import 'package:ptmose/models/responses/wineries_list_by_location_reaponse.dart';

import '../models/orderItemModel.dart';
import '../models/requests/auth_request/social_media_login_request.dart';
import '../models/requests/change_password_request.dart';
import '../models/requests/location_request.dart';
import '../models/requests/auth_request/login_request.dart';
import '../models/requests/reserve_tasting_request.dart';
import '../models/requests/submit_order_request.dart';
import '../models/requests/submit_review_request.dart';
import '../models/requests/tastings_list_by_location_request.dart';
import '../models/requests/user_reservations_request.dart';
import '../models/requests/wine_detail_request.dart';
import '../models/requests/wineries_and_testing_request.dart';
import '../models/requests/wineries_details_request.dart';
import '../models/requests/wines_list_request.dart';
import '../models/responses/auth_response/login_response.dart';
import '../models/responses/auth_response/social_media_login_response.dart';
import '../models/responses/change_name_response.dart';
import '../models/responses/locations_model.dart';
import '../models/responses/reserve_tasting_response.dart';
import '../models/responses/submit_order_response.dart';
import '../models/responses/submit_review_response.dart';
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<SocialMediaLoginResponse?> socialMediaLoginApi(
    SocialMediaLoginRequest socialMediaLoginRequest) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = socialMediaLoginRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    SocialMediaLoginResponse socialMediaLoginResponse =
        SocialMediaLoginResponse.fromJson(json.decode(responseData.body));

    return socialMediaLoginResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<LocationsModel?> getAllLocationsApi(
    {required LocationRequest locationRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<WineriesAndTestingResponse?> getWineriesAndTastings(
    {required WineriesAndTastingsRequest wineriesAndLocationRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<WineriesDetailsResponse?> getWineryDetails(
    {required WineriesDetailRequest wineriesDetailRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<TastingsDetailResponse?> getTastingsDetails(
    {required TastingsDetailsRequest tastingsDetailsRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<WineDetailResponse?> getWineDetails(
    {required WineDetailRequest wineDetailRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<WinesListResponse?> getWinesList(
    {required WinesListRequest winesListRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<ReserveTastingResponse?> reserveTasting(
    {required ReserveTastingRequest reserveTastingRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<SubmitReviewResponse?> submitReview(
    {required SubmitReviewRequest submitReviewRequest}) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = submitReviewRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    SubmitReviewResponse submitReviewResponse =
        SubmitReviewResponse.fromJson(json.decode(responseData.body));

    return submitReviewResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<SubmitOrderResponse?> submitOrder(
    {required SubmitOrderRequest submitOrderRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<UserReservationResponse?> getReservations(
    {required UserReservationsRequest reservationsRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<ReviewListResponse?> getReviews(
    {required ReviewListRequest reviewListRequest}) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = reviewListRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    ReviewListResponse reviewListResponse =
        ReviewListResponse.fromJson(json.decode(responseData.body));

    return reviewListResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<WineriesListByLocationResponse?> getAllWineriesListByLocation(
    {required WineriesListByLocationRequest
        wineriesListByLocationRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<TastingListByLocationResponse?> getAllTastingListByLocation(
    {required TastingListByLocationRequest
        tastingListByLocationRequest}) async {
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
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<ChangePasswordResponse?> changePasswordApi(
    {required ChangePasswordRequest changePasswordRequest}) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = changePasswordRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    ChangePasswordResponse changePasswordResponse =
        ChangePasswordResponse.fromJson(json.decode(responseData.body));

    return changePasswordResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}

Future<ChangeNameResponse?> changeNameApi(
    {required ChangeNameRequest changeNameRequest}) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = changeNameRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    ChangeNameResponse changeNameResponse =
        ChangeNameResponse.fromJson(json.decode(responseData.body));

    return changeNameResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}


Future<StripePaymentResponse?> paymentApi(
    {required StripePaymentRequest stripePaymentRequest}) async {
  var request = http.Request('POST', Uri.parse(_baseURL));

  request.body = stripePaymentRequest.generateQuery();
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    StripePaymentResponse stripePaymentResponse =
    StripePaymentResponse.fromJson(json.decode(responseData.body));

    return stripePaymentResponse;
  } else {
    EasyLoading.showError('Something Went Wrong');

    print(response.reasonPhrase);
    return null;
  }
}