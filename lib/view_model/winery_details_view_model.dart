import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';
import '../models/responses/tasting_model.dart';

class WineryDetailsViewModel with ChangeNotifier{

  final List<TastingModel> _featuredTestingList = [];

  List<TastingModel> get getFeaturedTestingList => _featuredTestingList;


  void setFeaturedTestingList(List<TastingModel> value) {
    _featuredTestingList.addAll(value);
    notifyListeners();
  }

  callFeaturedTestingListApi(){
    _featuredTestingList.clear();
    setFeaturedTestingList(DummyData().tastingList);
  }

}