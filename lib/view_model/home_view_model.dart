import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/dummy_data.dart';

import '../Service/api_service.dart';
import '../models/responses/tasting_model.dart';
import '../models/responses/wineries_and_testing_response.dart';
import '../models/responses/wineries_model.dart';
import '../utils/shared_pref .dart';

class HomeViewModel with ChangeNotifier {
  final List<Tastings> _tastingList = [];
  final List<Wineries> _wineriesList = [];
  WineriesAndTestingResponse? _wineriesAndTestingResponse;

  WineriesAndTestingResponse get getWineriesAndTestingResponse => _wineriesAndTestingResponse!;

  List<Wineries> get getWineriesList => _wineriesList;

  List<Tastings> get getTastingList => _tastingList;

  void setWineriesAndTestingResponse(WineriesAndTestingResponse value) {
    _wineriesAndTestingResponse = value;
    notifyListeners();
  }

  void setWineriesList(List<Wineries> value) {
    _wineriesList.addAll(value);
    notifyListeners();
  }

  void setTestingList(List<Tastings> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  /*callTestingListApi() {
    _tastingList.clear();
    setTestingList(DummyData().tastingList);
  }*/

  Future <void> callWineriesAndTestingList(int? locationId) async {
    EasyLoading.show(status: 'Please Wait...');
    _wineriesList.clear();
    _tastingList.clear();

    final response = await getWineriesAndTastings(locationId);
    if (response != null) {
      setWineriesAndTestingResponse(response);
      if (_wineriesAndTestingResponse!.data!.getWineryByLocation!.data!.wineries!.isNotEmpty) {
        setWineriesList(_wineriesAndTestingResponse!.data!.getWineryByLocation!.data!.wineries!);
      }
      if (_wineriesAndTestingResponse!.data!.getWineryByLocation!.data!.tastings!.isNotEmpty) {
        setTestingList(_wineriesAndTestingResponse!.data!.getWineryByLocation!.data!.tastings!);
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }


}
