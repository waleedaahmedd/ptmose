import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/Wines_response.dart';

import '../dummy_data.dart';

class ShopViewModel with ChangeNotifier{
  final List<Wine> _winesList = [];
  TextEditingController searchController = TextEditingController();


  List<Wine> get getWinesList => _winesList;

  void setWinesList(List<Wine> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  callWinesListApi(){
    _winesList.clear();
    //setWinesList(DummyData().winesList);
  }

}
