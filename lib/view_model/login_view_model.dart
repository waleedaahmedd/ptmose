import 'package:flutter/cupertino.dart';

import '../Service/api_service.dart';
import '../models/requests/post.dart';
import '../utils/CRUD_data_locally.dart';

class LoginViewModel with ChangeNotifier {

  TextEditingController nameController = TextEditingController();

  PostModel post = PostModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    CRUDDataLocally.saveTokenLocally('',post.id);
    loading = false;

    notifyListeners();
  }



}


