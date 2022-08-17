import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/requests/payment_request.dart';
import 'package:ptmose/models/responses/payment_response.dart';
import 'package:ptmose/models/responses/wines_response.dart';
import 'package:ptmose/models/responses/submit_order_response.dart';
import 'package:ptmose/models/responses/wine_detail_response.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../models/orderItemModel.dart';
import '../models/requests/submit_order_request.dart';
import '../models/requests/wine_detail_request.dart';

class CartViewModel with ChangeNotifier {
  int _cartCount = 0;
  int _quantityCount = 1;
  int _totalAmount = 0;
  SubmitOrderResponse? _submitOrderResponse;
  WineDetailResponse? _wineDetailResponse;
  StripePaymentResponse? _stripePaymentResponse;
  final List<GetWineByIdData> _cartWineList = [];
  final List<OrderItemModel> _orderItemList = [];

  int get getCartCount => _cartCount;

  int get getTotalAmount => _totalAmount;

  int get getQuantityCount => _quantityCount;

  SubmitOrderResponse get getSubmitOrderResponse => _submitOrderResponse!;

  List<GetWineByIdData> get getCartWineList => _cartWineList;

  List<OrderItemModel> get getOrderItemList => _orderItemList;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  StripePaymentResponse get getStripePaymentResponse => _stripePaymentResponse!;

  void addItemsToCart(GetWineByIdData value) {
    var _index = _cartWineList.indexWhere((element) => element.id == value.id);
    _index != -1
        ? addOrderItemQuantity(_index, _quantityCount)
        : addCartWineList(value);

    notifyListeners();
  }

  void setSubmitOrderResponse(SubmitOrderResponse value) {
    _submitOrderResponse = value;
    notifyListeners();
  }

  void setTotalAmount() {
    _totalAmount = 0;
    for (var item in _orderItemList) {
      _totalAmount += item.amount!;
    }
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
        wineId: value.id,
        quantity: _quantityCount,
        amount: value.price! * _quantityCount));
    setTotalAmount();
    notifyListeners();
  }

  void addOrderItemQuantity(int index, int count) {
    _orderItemList[index].quantity = _orderItemList[index].quantity! + count;
    _orderItemList[index].amount =
        _orderItemList[index].quantity! * _cartWineList[index].price!;
    addCartCount(count);
    setTotalAmount();

    notifyListeners();
  }

  void removeOrderItemQuantity(int index, int count) {
    _orderItemList[index].quantity = _orderItemList[index].quantity! - count;
    _orderItemList[index].amount =
        _orderItemList[index].quantity! * _cartWineList[index].price!;
    minusCartCount();
    setTotalAmount();

    notifyListeners();
  }

  void deleteItemFromCart(int index) {
    _totalAmount = _totalAmount - _orderItemList[index].amount!;
    _cartCount = _cartCount - _orderItemList[index].quantity!;
    _cartWineList.removeAt(index);
    _orderItemList.removeAt(index);
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

  void setStripePaymentResponse(StripePaymentResponse value) {
    _stripePaymentResponse = value;
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

  _clearCart() {
    _cartCount = 0;
    _totalAmount = 0;
    _cartWineList.clear();
    _orderItemList.clear();
  }

  Future<void> callWineDetails(int? wineId) async {
    EasyLoading.show(status: 'Please Wait...');
    WineDetailRequest wineDetailRequest = WineDetailRequest(wineId!);

    final response = await getWineDetails(wineDetailRequest: wineDetailRequest);
    if (response != null) {
      setWineDetailResponse(response);
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> callSubmitOrder(int? userId) async {
    EasyLoading.show(status: 'Please Wait...');
    String cartItems = jsonEncode(getOrderItemList);
    SubmitOrderRequest submitOrderRequest =
        SubmitOrderRequest(userId!, cartItems, '', getTotalAmount);
    final response = await submitOrder(submitOrderRequest: submitOrderRequest);
    if (response != null) {
      setSubmitOrderResponse(response);
      if (getSubmitOrderResponse.data!.createOrder!.status!) {
        _clearCart();

        EasyLoading.showSuccess(
            getSubmitOrderResponse.data!.createOrder!.message!);
      } else {
        EasyLoading.showError(
            getSubmitOrderResponse.data!.createOrder!.message!);
      }
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> callStripePayment({required int userId}) async {
    EasyLoading.show(status: 'Please Wait...');
    StripePaymentRequest stripePaymentRequest =
        StripePaymentRequest(userId: userId, amount: _totalAmount);

    final response =
        await paymentApi(stripePaymentRequest: stripePaymentRequest);
    if (response!.data!.createPaymentIntent != null) {
      setStripePaymentResponse(response);
      if (getStripePaymentResponse.data!.createPaymentIntent!.status!) {
        initializePaymentSheet(userId);
      }

      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }

  Future<void> initializePaymentSheet(int userId) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters:  SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret:
        getStripePaymentResponse.data!.createPaymentIntent!.data!.clientSecret,
        merchantDisplayName: 'PTMOSE',
        // Customer params
        customerId: getStripePaymentResponse.data!.createPaymentIntent!.data!.stripeCustomerId,
        //customerEphemeralKeySecret: getStripePaymentResponse.data!.createPaymentIntent!.data!.paymentIntentId,
        // Extra params
        applePay: const PaymentSheetApplePay(
          merchantCountryCode: 'DE',
        ),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'DE',
         // testEnv: true,
        ),
        style: ThemeMode.light,
        appearance: const PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            background: CustomColors.purple,
            primary: CustomColors.purple,
            componentBorder: CustomColors.golden,
            primaryText: Colors.white,
            secondaryText: Colors.white,
            icon: Colors.white,
          ),
          shapes: PaymentSheetShape(
            borderWidth: 5,
            shadow: PaymentSheetShadowParams(color: CustomColors.golden),
          ),
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            shapes: PaymentSheetPrimaryButtonShape(blurRadius: 20),
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: CustomColors.golden,
                text: CustomColors.purple,
                border: CustomColors.purple,
              ),
            ),
          ),
        ),
      ),
    );
    presentPaymentSheet(userId);
  }

  Future<void> presentPaymentSheet(int userId) async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      callSubmitOrder(userId);
    } on Exception catch (e) {
      if (e is StripeException) {
        EasyLoading.showError('Error from Stripe: ${e.error.localizedMessage}');
      } else {
        EasyLoading.showError('Unforeseen error: $e');
      }
    }
  }
}
