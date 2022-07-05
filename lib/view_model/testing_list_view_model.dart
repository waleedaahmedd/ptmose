import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';
import '../models/responses/tasting_model.dart';

class TestingListViewModel with ChangeNotifier {
  final List<TastingModel> _tastingList = [];

  List<TastingModel> get getTastingList => _tastingList;

  void setTestingList(List<TastingModel> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  callTestingListApi() {
    _tastingList.clear();
    setTestingList(DummyData().tastingList);
  }
}
