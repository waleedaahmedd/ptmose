import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/responses/Wines_response.dart';
import 'package:ptmose/models/responses/wine_detail_response.dart';

import '../models/orderItemModel.dart';

class CartViewModel with ChangeNotifier {
  int _cartCount = 0;
  WineDetailResponse? _wineDetailResponse;
  final List<GetWineByIdData> _cartWineList = [];
  final List<OrderItemModel> _orderItemList = [];

  int get getCartCount => _cartCount;
  List<GetWineByIdData> get getCartWineList => _cartWineList;
  List<OrderItemModel> get getOrderItemList => _orderItemList;


  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  void addCartWineList(GetWineByIdData value) {
    _cartWineList.contains(value)?(){}:
    _cartWineList.add(value);
    notifyListeners();
  }

  void removeCartWineList(GetWineByIdData value) {
    _cartWineList.remove(value);
    notifyListeners();
  }

  void setWineDetailResponse(WineDetailResponse value) {
    _wineDetailResponse = value;
    notifyListeners();
  }


  void addCartCount(int value) {
    _cartCount = value+_cartCount;
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
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }
}
