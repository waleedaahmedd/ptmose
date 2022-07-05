import 'package:flutter/cupertino.dart';
import 'package:ptmose/dummy_data.dart';

import '../models/responses/tasting_model.dart';
import '../models/responses/wineries_model.dart';

class HomeViewModel with ChangeNotifier {
  final List<TastingModel> _tastingList = [];
  final List<WineriesModel> _wineriesList = [];

  List<WineriesModel> get getWineriesList => _wineriesList;

  List<TastingModel> get getTastingList => _tastingList;

  void setWineriesList(List<WineriesModel> value) {
    _wineriesList.addAll(value);
    notifyListeners();
  }

  void setTestingList(List<TastingModel> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  callTestingListApi() {
    _tastingList.clear();
    setTestingList(DummyData().tastingList);
  }

  callWineriesList() {
    _wineriesList.clear();
    setWineriesList(DummyData().wineriesList);
  }
}
