import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/responses/Wines_response.dart';
import 'package:ptmose/models/responses/wine_detail_response.dart';

import '../models/orderItemModel.dart';

class CartViewModel with ChangeNotifier {
  int _cartCount = 0;
  int _quantityCount = 1;
  WineDetailResponse? _wineDetailResponse;
  final List<GetWineByIdData> _cartWineList = [];
  final List<OrderItemModel> _orderItemList = [];

  int get getCartCount => _cartCount;

  int get getQuantityCount => _quantityCount;

  List<GetWineByIdData> get getCartWineList => _cartWineList;

  List<OrderItemModel> get getOrderItemList => _orderItemList;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  void addItemsToCart(GetWineByIdData value) {
    var _index = _cartWineList.indexWhere((element) => element.id == value.id);
    _index != -1
        ? addOrderItemQuantity(
            _index,
            _quantityCount)
        : addCartWineList(value);

    notifyListeners();
  }

  void addCartWineList(GetWineByIdData value) {
    _cartWineList.add(value);
    addCartCount(_quantityCount);
    addOrderItemList(value);

    notifyListeners();
  }

  void addOrderItemList(GetWineByIdData value) {
    _orderItemList.add(OrderItemModel(
        wineId: value.id, quantity: _quantityCount, amount: value.price));

    notifyListeners();
  }

  void addOrderItemQuantity(int index, int count) {
    _orderItemList[index].quantity = _orderItemList[index].quantity! + count;
    addCartCount(count);

    notifyListeners();
  }

  void removeOrderItemQuantity(int index, int count) {
    _orderItemList[index].quantity = _orderItemList[index].quantity! - count;
    minusCartCount();

    notifyListeners();
  }

  void setQuantityCount(int value) {
    _quantityCount = value;
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
    _cartCount = value + _cartCount;
    notifyListeners();
  }

  void minusCartCount() {
    _cartCount = --_cartCount;
    notifyListeners();
  }

  Future<void> callWineDetails(int? wineId) async {
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
