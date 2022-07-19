import 'package:flutter/cupertino.dart';
import 'package:ptmose/models/responses/tastings_response.dart';

class MyReservationViewModel with ChangeNotifier {
  bool _confirmedReservationsList = true;
  final List<Tastings> _tastingList = [];

  bool get getConfirmedReservationsList => _confirmedReservationsList;

  List<Tastings> get getTastingList => _tastingList;

  void setConfirmedReservationsList(bool value) {
    _confirmedReservationsList = value;
    notifyListeners();
  }

  void setWineriesList(List<Tastings> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  callTastingList() {
    _tastingList.clear();
    // setWineriesList(DummyData().tastingList);
  }
}
