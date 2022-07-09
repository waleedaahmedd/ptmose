import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/wines_model.dart';

import '../dummy_data.dart';
import '../models/responses/tasting_model.dart';

class TastingDetailsViewModel with ChangeNotifier {
  final List<WinesModel> _winesList = [];

  List<WinesModel> get getWinesList => _winesList;

  void setWinesList(List<WinesModel> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  callWinesListApi() {
    _winesList.clear();
    setWinesList(DummyData().winesList);
  }
}
