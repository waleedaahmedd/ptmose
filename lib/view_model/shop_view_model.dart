import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/Wines_response.dart';
import 'package:ptmose/models/responses/wines_list_response.dart';

import '../Service/api_service.dart';
import '../models/requests/wines_list_request.dart';
import '../models/responses/wines_list_response.dart';

class ShopViewModel with ChangeNotifier {
  final List<Wine> _winesList = [];
  List<Wine> _searchWinesList = [];
  WinesListResponse? _winesListResponse;
  TextEditingController searchController = TextEditingController();

  List<Wine> get getWines => _winesList;

  List<Wine> get getSearchWinesList => _searchWinesList;

  WinesListResponse get getWinesListResponse => _winesListResponse!;

  void setWinesListResponse(WinesListResponse value) {
    _winesListResponse = value;
    notifyListeners();
  }

  void setSearchWines(String value) {
    _searchWinesList = _winesList
        .where((element) =>
            element.wineName!.toLowerCase().contains(value) ||
            element.wineName!.contains(value))
        .toList();
    notifyListeners();
  }

  void setWines(List<Wine> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  Future<void> callWinesListApi() async {
    EasyLoading.show(status: 'Please Wait...');
    _winesList.clear();
    WinesListRequest winesListRequest = WinesListRequest();

    final response = await getWinesList(winesListRequest: winesListRequest);
    if (response != null) {
      setWinesListResponse(response);
      if (_winesListResponse!.data!.getAllWines!.data!.isNotEmpty) {
        setWines(_winesListResponse!.data!.getAllWines!.data!);
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
