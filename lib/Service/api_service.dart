import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/requests/login_request.dart';
import '../models/requests/post.dart';
import '../models/responses/login_response.dart';

var _baseURL = Uri.parse('https://example.com/whatsit/create');

Future<PostModel> getSinglePostData(context) async {
  PostModel? result;
  try {
    final response = await http.get(
      _baseURL,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = PostModel.fromJson(item);
    } else {
     /* Toast.show("Data not found", context,
          duration: 2, backgroundColor: Colors.redAccent);*/
    }
  } catch (e) {
    print(e);
  }
  return result!;
}

Future<LoginResponse> userLogin() async {
  LoginRequest? request;
  LoginResponse? result;

  var bodyData = json.encode(request!.toJson());
  try {
    final response = await http.post(
      _baseURL,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: bodyData
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = LoginResponse.fromJson(item);
    } else {
      /* Toast.show("Data not found", context,
          duration: 2, backgroundColor: Colors.redAccent);*/
    }
  } catch (e) {
    print(e);
  }
  return result!;
}
