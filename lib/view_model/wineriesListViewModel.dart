import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';
import '../models/responses/wineries_model.dart';

class WineriesListViewModel with ChangeNotifier {
  final List<WineriesModel> _wineriesList = [];

  List<WineriesModel> get getWineriesList => _wineriesList;

  void setWineriesList(List<WineriesModel> value) {
    _wineriesList.addAll(value);
    notifyListeners();
  }

  callWineriesList() {
    _wineriesList.clear();
    setWineriesList(DummyData().wineriesList);
  }
}
