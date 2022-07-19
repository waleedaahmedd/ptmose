import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/wineries_response.dart';

import '../dummy_data.dart';

class WineriesListViewModel with ChangeNotifier {
  final List<Wineries> _wineriesList = [];

  List<Wineries> get getWineriesList => _wineriesList;

  void setWineriesList(List<Wineries> value) {
    _wineriesList.addAll(value);
    notifyListeners();
  }

  callWineriesList() {
    _wineriesList.clear();
   // setWineriesList(DummyData().wineriesList);
  }
}
