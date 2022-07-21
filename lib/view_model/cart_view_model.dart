import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/responses/wine_detail_response.dart';

class CartViewModel with ChangeNotifier {
  int _cartCount = 0;
  WineDetailResponse? _wineDetailResponse;

  int get getCartCount => _cartCount;
  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  void setWineDetailResponse(WineDetailResponse value) {
    _wineDetailResponse = value;
    notifyListeners();
  }


  void addCartCount() {
    _cartCount = ++_cartCount;
    notifyListeners();
  }

  void minusCartCount() {
    _cartCount = --_cartCount;
    notifyListeners();
  }

  Future <void> callWineDetails(int? wineId) async {
    EasyLoading.show(status: 'Please Wait...');

    final response = await getWineDetails(wineId);
    if (response != null) {
      setWineDetailResponse(response);
    /*  if (_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!.isNotEmpty) {
        setWinesList(_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!);
      }*/
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
