import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/Wines_response.dart';
import 'package:ptmose/models/responses/wines_list_response.dart';

import '../Service/api_service.dart';
import '../dummy_data.dart';

class ShopViewModel with ChangeNotifier{
  final List<Wine> _winesList = [];
  WinesListResponse? _winesListResponse;
  TextEditingController searchController = TextEditingController();


  List<Wine> get getWines => _winesList;

  WinesListResponse get getWinesListResponse => _winesListResponse!;

  void setWinesListResponse(WinesListResponse value) {
    _winesListResponse = value;
    notifyListeners();
  }

  void setWines(List<Wine> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  Future <void> callWinesListApi() async {
    EasyLoading.show(status: 'Please Wait...');
    _winesList.clear();

    final response = await getWinesList();
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
