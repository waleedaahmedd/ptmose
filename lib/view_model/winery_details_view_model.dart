import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/wines_model.dart';

import '../dummy_data.dart';
import '../models/responses/tasting_model.dart';

class WineryDetailsViewModel with ChangeNotifier{

  final List<TastingModel> _tastingList = [];
  final List<WinesModel> _winesList = [];

  List<TastingModel> get getTastingList => _tastingList;
  List<WinesModel> get getWinesList => _winesList;



  void setTastingList(List<TastingModel> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  void setWinesList(List<WinesModel> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  callTastingListApi(){
    _tastingList.clear();
    setTastingList(DummyData().tastingList);
  }

  callWinesListApi(){
    _winesList.clear();
    setWinesList(DummyData().winesList);
  }

}