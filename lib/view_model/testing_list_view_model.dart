import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/tastings_response.dart';


class TestingListViewModel with ChangeNotifier {
  final List<Tastings> _tastingList = [];

  List<Tastings> get getTastingList => _tastingList;

  void setTestingList(List<Tastings> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  callTestingListApi() {
    _tastingList.clear();
    //setTestingList(DummyData().tastingList);
  }
}
