import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/responses/tastings_response.dart';
import 'package:ptmose/models/responses/wineries_detail_response.dart';

import '../models/requests/wineries_details_request.dart';
import '../models/responses/wines_response.dart';

class WineryDetailsViewModel with ChangeNotifier {
  final List<Tastings> _tastingList = [];
  final List<Wine> _winesList = [];
  WineriesDetailsResponse? _wineriesDetailsResponse;
  bool _showWineriesShop = false;
  bool _isWineryDetailScreenEnable = false;

  WineriesDetailsResponse get getWineriesDetailsResponse =>
      _wineriesDetailsResponse!;

  List<Tastings> get getTastingList => _tastingList;

  List<Wine> get getWinesList => _winesList;

  bool get getShowWineriesShop => _showWineriesShop;

  bool get getIsWineryDetailScreenEnable => _isWineryDetailScreenEnable;

  void setShowWineriesShop(bool value) {
    _showWineriesShop = value;
    notifyListeners();
  }

  void setIsWineryDetailScreenEnable(bool value) {
    _isWineryDetailScreenEnable = value;
    notifyListeners();
  }

  void setWineriesDetailsResponse(WineriesDetailsResponse value) {
    _wineriesDetailsResponse = value;
    notifyListeners();
  }

  void setTastingList(List<Tastings> value) {
    _tastingList.addAll(value);
    notifyListeners();
  }

  void setWinesList(List<Wine> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  Future<void> callWineriesDetails(int? wineryId) async {
    EasyLoading.show(status: 'Please Wait...');
    _winesList.clear();
    _tastingList.clear();
    WineriesDetailRequest wineriesDetailRequest =
        WineriesDetailRequest(wineryId!);
    final response =
        await getWineryDetails(wineriesDetailRequest: wineriesDetailRequest);
    if (response != null) {
      setWineriesDetailsResponse(response);
      if (_wineriesDetailsResponse!
          .data!.getWineryById!.data!.wine!.isNotEmpty) {
        setWinesList(
            _wineriesDetailsResponse!.data!.getWineryById!.data!.wine!);
      }
      if (_wineriesDetailsResponse!
          .data!.getWineryById!.data!.tasting!.isNotEmpty) {
        setTastingList(
            _wineriesDetailsResponse!.data!.getWineryById!.data!.tasting!);
      }
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
