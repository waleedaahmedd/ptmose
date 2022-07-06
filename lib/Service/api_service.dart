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

/*Future<LoginResponse> userLogin() async {
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
      */ /* Toast.show("Data not found", context,
          duration: 2, backgroundColor: Colors.redAccent);*/ /*
    }
  } catch (e) {
    print(e);
  }
  return result!;
}*/

const String query =
    'query {'
    'loginUser(email: \\"Mudassir@gmail.com\\", password: \\"123456789\\") {\\n    status\\n    message\\n    data {\\n      id\\n      email\\n      firstName\\n    }\\n  }\\n}\\n';

/*const String query = '''
  query {
  loginUser(email: "Mudassir@gmail.com", password: "123456789") {
    status
    message
    data {
      id
      email
      firstName
    }
  }
}
''';*/

const String queryVariables = '''
{}
''';

Future<String?> callGraphApi() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://howmuchbackend.herokuapp.com/graphql'));
  request.body = '''{"query":"$query","variables": $queryVariables}''';

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final sex = await http.Response.fromStream(response);
    print(sex.body);

    return sex.body;
  } else {
    print(response.reasonPhrase);

    return null;
  }
}
