import 'package:flutter/cupertino.dart';

import '../models/responses/Wines_response.dart';

class TastingDetailsViewModel with ChangeNotifier {
  final List<Wine> _winesList = [];

  List<Wine> get getWinesList => _winesList;

  void setWinesList(List<Wine> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  callWinesListApi() {
    _winesList.clear();
    //setWinesList(DummyData().winesList);
  }
}
