import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/tastings_response.dart';
import 'package:ptmose/models/responses/user_reservation_response.dart';

import '../Service/api_service.dart';

class MyReservationViewModel with ChangeNotifier {
  bool _confirmedReservations = true;
  final List<Tastings> _confirmReservationList = [];
  final List<Tastings> _unConfirmReservationList = [];
  UserReservationResponse? _userReservationResponse;

  bool get getConfirmedReservations => _confirmedReservations;

  UserReservationResponse get getUserReservationResponse =>
      _userReservationResponse!;

  List<Tastings> get getConfirmReservationList => _confirmReservationList;

  List<Tastings> get getUnConfirmReservationList => _unConfirmReservationList;

  void setConfirmedReservations(bool value) {
    _confirmedReservations = value;
    notifyListeners();
  }

  void setUserReservationResponse(UserReservationResponse value) {
    _userReservationResponse = value;
    notifyListeners();
  }

  void setConfirmReservationList(Tastings value) {
    _confirmReservationList.add(value);
    notifyListeners();
  }

  void setUnConfirmReservationList(Tastings value) {
    _unConfirmReservationList.add(value);
    notifyListeners();
  }

  Future<void> callUserReservations(int? userId) async {
    EasyLoading.show(status: 'Please Wait...');
    _confirmReservationList.clear();
    _unConfirmReservationList.clear();
    setConfirmedReservations(true);
    final response = await getReservations(userId);
    if (response != null) {
      setUserReservationResponse(response);
      if (_userReservationResponse!.data!.getAllReservation!.data!.isNotEmpty) {
        for (int i = 0;
            i < _userReservationResponse!.data!.getAllReservation!.data!.length;
            i++) {
          _userReservationResponse!.data!.getAllReservation!.data![i].status! ==
                  'Confirmed'
              ? setConfirmReservationList(_userReservationResponse!
                  .data!.getAllReservation!.data![i].tasting!)
              : setUnConfirmReservationList(_userReservationResponse!
                  .data!.getAllReservation!.data![i].tasting!);
        }
      }
      EasyLoading.dismiss();

      /*getReserveTastingResponse.data!.addReservers!.status! ?
      EasyLoading.showSuccess(
          getReserveTastingResponse.data!.addReservers!.message!) :
      EasyLoading.showError(
          getReserveTastingResponse.data!.addReservers!.message!);*/
    } else {
      EasyLoading.dismiss();
    }
  }
}
