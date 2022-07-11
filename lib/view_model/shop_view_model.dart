import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';
import '../models/responses/wines_model.dart';

class ShopViewModel with ChangeNotifier{
  final List<WinesModel> _winesList = [];
  TextEditingController searchController = TextEditingController();


  List<WinesModel> get getWinesList => _winesList;

  void setWinesList(List<WinesModel> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  callWinesListApi(){
    _winesList.clear();
    setWinesList(DummyData().winesList);
  }

}
