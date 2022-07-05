import 'package:flutter/cupertino.dart';

import '../dummy_data.dart';
import '../models/responses/featured_testing_model.dart';

class WineryDetailsViewModel with ChangeNotifier{

  final List<FeaturedTestingModel> _featuredTestingList = [];

  List<FeaturedTestingModel> get getFeaturedTestingList => _featuredTestingList;


  void setFeaturedTestingList(List<FeaturedTestingModel> value) {
    _featuredTestingList.addAll(value);
    notifyListeners();
  }

  callFeaturedTestingListApi(){
    _featuredTestingList.clear();
    setFeaturedTestingList(DummyData().featuredTestingList);
  }

}