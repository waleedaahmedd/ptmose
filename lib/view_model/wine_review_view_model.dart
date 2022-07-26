import 'package:flutter/cupertino.dart';

import '../models/responses/wine_detail_response.dart';

class WineReviewViewModel with ChangeNotifier {
  TextEditingController detailController = TextEditingController();
  WineDetailResponse? _wineDetailResponse;
  int _fruitForward = 0;
  int _berrys = 0;
  int _fullBodied = 0;
  int _thin = 0;
  int _longFinish = 0;
  int _bakance = 0;
  int _complex = 0;
  int _elegant = 0;
  int _chewy = 0;
  int _soft = 0;
  int _silky = 0;
  int _burn = 0;
  int _jammy = 0;
  int _bellPepper = 0;
  int _spicy = 0;
  int _toasty = 0;
  int _oak = 0;
  int _vegetable = 0;
  int _minerality = 0;
  int _rubber = 0;
  int _smoky = 0;
  int _ageOfWine = 0;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  int get getFruitForward => _fruitForward;

  int get getBerrys => _berrys;

  int get getFullBodied => _fullBodied;

  int get getThin => _thin;

  int get getLongFinish => _longFinish;

  int get getBakance => _bakance;

  int get getComplex => _complex;

  int get getElegant => _elegant;

  int get getChewy => _chewy;

  int get getSoft => _soft;

  int get getSilky => _silky;

  int get getBurn => _burn;

  int get getJammy => _jammy;

  int get getBellpepper => _bellPepper;

  int get getSpicy => _spicy;

  int get getToasty => _toasty;

  int get getOak => _oak;

  int get getVegetable => _vegetable;

  int get getMinerality => _minerality;

  int get getRubber => _rubber;

  int get getSmoky => _smoky;

  int get getAgeOfWine => _ageOfWine;

  void setAgeOfWine(int value) {
    _ageOfWine = value;
    notifyListeners();
  }

  void setSmoky(int value) {
    _smoky = value;
    notifyListeners();
  }

  void setRubber(int value) {
    _rubber = value;
    notifyListeners();
  }

  void setMinerality(int value) {
    _minerality = value;
    notifyListeners();
  }

  void setVegetable(int value) {
    _vegetable = value;
    notifyListeners();
  }

  void setOak(int value) {
    _oak = value;
    notifyListeners();
  }

  void setToasty(int value) {
    _toasty = value;
    notifyListeners();
  }

  void setSpicy(int value) {
    _spicy = value;
    notifyListeners();
  }

  void setBellpepper(int value) {
    _bellPepper = value;
    notifyListeners();
  }

  void setJammy(int value) {
    _jammy = value;
    notifyListeners();
  }

  void setBurn(int value) {
    _burn = value;
    notifyListeners();
  }

  void setSilky(int value) {
    _silky = value;
    notifyListeners();
  }

  void setSoft(int value) {
    _soft = value;
    notifyListeners();
  }

  void setChewy(int value) {
    _chewy = value;
    notifyListeners();
  }

  void setElegant(int value) {
    _elegant = value;
    notifyListeners();
  }

  void setComplex(int value) {
    _complex = value;
    notifyListeners();
  }

  void setBakance(int value) {
    _bakance = value;
    notifyListeners();
  }

  void setLongFinish(int value) {
    _longFinish = value;
    notifyListeners();
  }

  void setThin(int value) {
    _thin = value;
    notifyListeners();
  }

  void setFullBodied(int value) {
    _fullBodied = value;
    notifyListeners();
  }

  void setBerrys(int value) {
    _berrys = value;
    notifyListeners();
  }

  void setFruitForward(int value) {
    _fruitForward = value;
    notifyListeners();
  }

  void setWineDetailResponse(WineDetailResponse value) {
    _wineDetailResponse = value;
    notifyListeners();
  }
}
