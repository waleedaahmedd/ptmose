import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/tasting_model.dart';

import '../dummy_data.dart';
import '../models/responses/wineries_model.dart';

class MyReservationViewModel with ChangeNotifier {

   bool _confirmedReservationsList = true;
   final List<TastingModel> _tastingList = [];


   bool get getConfirmedReservationsList => _confirmedReservationsList;
   List<TastingModel> get getTastingList => _tastingList;


   void setConfirmedReservationsList(bool value) {
    _confirmedReservationsList = value;
    notifyListeners();
  }

   void setWineriesList(List<TastingModel> value) {
     _tastingList.addAll(value);
     notifyListeners();
   }

   callTastingList() {
     _tastingList.clear();
     setWineriesList(DummyData().tastingList);
   }
}