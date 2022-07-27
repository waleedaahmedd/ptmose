import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/submit_order_response.dart';
import 'package:ptmose/models/responses/submit_review_response.dart';

import '../Service/api_service.dart';
import '../models/responses/wine_detail_response.dart';

class WineReviewViewModel with ChangeNotifier {
  TextEditingController detailController = TextEditingController();
  WineDetailResponse? _wineDetailResponse;
  SubmitReviewResponse? _submitReviewResponse;
  num _fruitForward = 0;
  num _berrys = 0;
  num _fullBodied = 0;
  num _thin = 0;
  num _longFinish = 0;
  num _bakance = 0;
  num _complex = 0;
  num _elegant = 0;
  num _chewy = 0;
  num _soft = 0;
  num _silky = 0;
  num _burn = 0;
  num _jammy = 0;
  num _bellPepper = 0;
  num _spicy = 0;
  num _toasty = 0;
  num _oak = 0;
  num _vegetable = 0;
  num _minerality = 0;
  num _rubber = 0;
  num _smoky = 0;
  num _ageOfWine = 0;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  SubmitReviewResponse get getSubmitReviewResponse => _submitReviewResponse!;

  num get getFruitForward => _fruitForward;

  num get getBerrys => _berrys;

  num get getFullBodied => _fullBodied;

  num get getThin => _thin;

  num get getLongFinish => _longFinish;

  num get getBakance => _bakance;

  num get getComplex => _complex;

  num get getElegant => _elegant;

  num get getChewy => _chewy;

  num get getSoft => _soft;

  num get getSilky => _silky;

  num get getBurn => _burn;

  num get getJammy => _jammy;

  num get getBellpepper => _bellPepper;

  num get getSpicy => _spicy;

  num get getToasty => _toasty;

  num get getOak => _oak;

  num get getVegetable => _vegetable;

  num get getMinerality => _minerality;

  num get getRubber => _rubber;

  num get getSmoky => _smoky;

  num get getAgeOfWine => _ageOfWine;

  void setAgeOfWine(num value) {
    _ageOfWine = value;
    notifyListeners();
  }

  void setSmoky(num value) {
    _smoky = value;
    notifyListeners();
  }

  void setRubber(num value) {
    _rubber = value;
    notifyListeners();
  }

  void setMinerality(num value) {
    _minerality = value;
    notifyListeners();
  }

  void setVegetable(num value) {
    _vegetable = value;
    notifyListeners();
  }

  void setOak(num value) {
    _oak = value;
    notifyListeners();
  }

  void setToasty(num value) {
    _toasty = value;
    notifyListeners();
  }

  void setSpicy(num value) {
    _spicy = value;
    notifyListeners();
  }

  void setBellpepper(num value) {
    _bellPepper = value;
    notifyListeners();
  }

  void setJammy(num value) {
    _jammy = value;
    notifyListeners();
  }

  void setBurn(num value) {
    _burn = value;
    notifyListeners();
  }

  void setSilky(num value) {
    _silky = value;
    notifyListeners();
  }

  void setSoft(num value) {
    _soft = value;
    notifyListeners();
  }

  void setChewy(num value) {
    _chewy = value;
    notifyListeners();
  }

  void setElegant(num value) {
    _elegant = value;
    notifyListeners();
  }

  void setComplex(num value) {
    _complex = value;
    notifyListeners();
  }

  void setBakance(num value) {
    _bakance = value;
    notifyListeners();
  }

  void setLongFinish(num value) {
    _longFinish = value;
    notifyListeners();
  }

  void setThin(num value) {
    _thin = value;
    notifyListeners();
  }

  void setFullBodied(num value) {
    _fullBodied = value;
    notifyListeners();
  }

  void setBerrys(num value) {
    _berrys = value;
    notifyListeners();
  }

  void setFruitForward(num value) {
    _fruitForward = value;
    notifyListeners();
  }

  void setWineDetailResponse(WineDetailResponse value, BuildContext context) {
    _wineDetailResponse = value;
    Navigator.of(context).pushNamed('/wines_review');
    notifyListeners();
  }

  void setSubmitReviewResponse(SubmitReviewResponse value) {
    _submitReviewResponse = value;
    notifyListeners();
  }

  Future<void> callReviewOrder(int? userId, BuildContext context) async {
    EasyLoading.show(status: 'Please Wait...');
    final response = await submitReview(
        berrys: _berrys,
        complex: _complex,
        rubber: _rubber,
        chewy: _chewy,
        oak: _oak,
        jammy: _jammy,
        bellPepper: _bellPepper,
        minerality: _minerality,
        toasty: _toasty,
        vegetable: _vegetable,
        spicy: _spicy,
        longFinish: _longFinish,
        wineId: _wineDetailResponse!.data!.getWineById!.data!.id!,
        bakance: _bakance,
        silky: _silky,
        smoky: _smoky,
        ageOfWine: _ageOfWine,
        elegant: _elegant,
        fruitForward: _fruitForward,
        fullBodied: _fullBodied,
        soft: _soft,
        thin: _thin,
        comment: detailController.text,
        userId: userId!,
        burn: _burn);
    if (response != null) {
      setSubmitReviewResponse(response);
      if (getSubmitReviewResponse.data!.addFeedback!.status!) {
        Navigator.pop(context);
        EasyLoading.showSuccess(
            getSubmitReviewResponse.data!.addFeedback!.message!);
      } else {
        EasyLoading.showError(
            getSubmitReviewResponse.data!.addFeedback!.message!);
      }
    } else {
      EasyLoading.dismiss();
    }
  }
}
