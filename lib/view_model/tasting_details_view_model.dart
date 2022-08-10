import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/Service/api_service.dart';
import 'package:ptmose/models/responses/reserve_tasting_response.dart';
import 'package:ptmose/models/responses/tastings_details_response.dart';
import 'package:ptmose/models/responses/tastings_response.dart';

import '../models/requests/reserve_tasting_request.dart';
import '../models/requests/tastings_details_request.dart';
import '../models/responses/wines_response.dart';

class TastingDetailsViewModel with ChangeNotifier {
  final List<TastingWines> _winesList = [];
  TastingsDetailResponse? _tastingsDetailResponse;
  ReserveTastingResponse? _reserveTastingResponse;

  List<TastingWines> get getWinesList => _winesList;

  TastingsDetailResponse get getTastingsDetailResponse => _tastingsDetailResponse!;

  ReserveTastingResponse get getReserveTastingResponse => _reserveTastingResponse!;

  void setReserveTastingResponse(ReserveTastingResponse value) {
    _reserveTastingResponse = value;
    notifyListeners();
  }

  void setTastingsDetailResponse(TastingsDetailResponse value) {
    _tastingsDetailResponse = value;
    notifyListeners();
  }

  void setWinesList(List<TastingWines> value) {
    _winesList.addAll(value);
    notifyListeners();
  }

  Future <void> callTastingDetails(int? tastingId) async {
    EasyLoading.show(status: 'Please Wait...');
    _winesList.clear();
    TastingsDetailsRequest tastingsDetailsRequest =
    TastingsDetailsRequest(tastingId!);
    final response = await getTastingsDetails(tastingsDetailsRequest: tastingsDetailsRequest);
    if (response != null) {
      setTastingsDetailResponse(response);
      if (_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!.isNotEmpty) {
        setWinesList(_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!);
      }
           EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
    }
  }

  Future <void> callReserveTasting(int? userId) async {
    EasyLoading.show(status: 'Please Wait...');
    ReserveTastingRequest reserveTastingRequest =
    ReserveTastingRequest(getTastingsDetailResponse.data!.getTastingById!.data!.id!, userId!);
    final response = await reserveTasting(reserveTastingRequest: reserveTastingRequest);
    if (response != null) {
      setReserveTastingResponse(response);
     /* if (_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!.isNotEmpty) {
        setWinesList(_tastingsDetailResponse!.data!.getTastingById!.data!.tastingWines!);
      }*/
      getReserveTastingResponse.data!.addReservers!.status!?
      EasyLoading.showSuccess(getReserveTastingResponse.data!.addReservers!.message!):
      EasyLoading.showError(getReserveTastingResponse.data!.addReservers!.message!);
    } else {
      EasyLoading.dismiss();
    }
  }
}
