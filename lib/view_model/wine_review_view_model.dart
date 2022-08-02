
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/requests/review_list_request.dart';
import 'package:ptmose/models/responses/submit_review_response.dart';

import '../Service/api_service.dart';
import '../models/requests/submit_review_request.dart';
import '../models/responses/review_list_response.dart';
import '../models/responses/wine_detail_response.dart';

class WineReviewViewModel with ChangeNotifier {
  TextEditingController detailController = TextEditingController();
  List<GetAllFeedbacksData> _wineReviewList = [];
  WineDetailResponse? _wineDetailResponse;
  ReviewListResponse? _reviewListResponse;
  SubmitReviewResponse? _submitReviewResponse;

  int? _reviewIndex;
  double _fruitForward = 0;
  double _berrys = 0;
  double _fullBodied = 0;
  double _thin = 0;
  double _longFinish = 0;
  double _bakance = 0;
  double _complex = 0;
  double _elegant = 0;
  double _chewy = 0;
  double _soft = 0;
  double _silky = 0;
  double _burn = 0;
  double _jammy = 0;
  double _bellPepper = 0;
  double _spicy = 0;
  double _toasty = 0;
  double _oak = 0;
  double _vegetable = 0;
  double _minerality = 0;
  double _rubber = 0;
  double _smoky = 0;
  double _ageOfWine = 0;

  int get getReviewIndex => _reviewIndex!;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  List<GetAllFeedbacksData> get getWineReviewList => _wineReviewList;

  ReviewListResponse get getReviewListResponse => _reviewListResponse!;


  SubmitReviewResponse get getSubmitReviewResponse => _submitReviewResponse!;

  double get getFruitForward => _fruitForward;

  double get getBerrys => _berrys;

  double get getFullBodied => _fullBodied;

  double get getThin => _thin;

  double get getLongFinish => _longFinish;

  double get getBakance => _bakance;

  double get getComplex => _complex;

  double get getElegant => _elegant;

  double get getChewy => _chewy;

  double get getSoft => _soft;

  double get getSilky => _silky;

  double get getBurn => _burn;

  double get getJammy => _jammy;

  double get getBellpepper => _bellPepper;

  double get getSpicy => _spicy;

  double get getToasty => _toasty;

  double get getOak => _oak;

  double get getVegetable => _vegetable;

  double get getMinerality => _minerality;

  double get getRubber => _rubber;

  double get getSmoky => _smoky;

  double get getAgeOfWine => _ageOfWine;

  void setAgeOfWine(double value) {
    _ageOfWine = value;
    notifyListeners();
  }
  void setReviewIndex(int value) {
    _reviewIndex = value;
    notifyListeners();
  }
  void setWineReviewList(List<GetAllFeedbacksData> value) {
    _wineReviewList = value;
    notifyListeners();
  }

  void setSmoky(double value) {
    _smoky = value;
    notifyListeners();
  }

  void setRubber(double value) {
    _rubber = value;
    notifyListeners();
  }

  void setMinerality(double value) {
    _minerality = value;
    notifyListeners();
  }

  void setVegetable(double value) {
    _vegetable = value;
    notifyListeners();
  }

  void setOak(double value) {
    _oak = value;
    notifyListeners();
  }

  void setToasty(double value) {
    _toasty = value;
    notifyListeners();
  }

  void setSpicy(double value) {
    _spicy = value;
    notifyListeners();
  }

  void setBellpepper(double value) {
    _bellPepper = value;
    notifyListeners();
  }

  void setJammy(double value) {
    _jammy = value;
    notifyListeners();
  }

  void setBurn(double value) {
    _burn = value;
    notifyListeners();
  }

  void setSilky(double value) {
    _silky = value;
    notifyListeners();
  }

  void setSoft(double value) {
    _soft = value;
    notifyListeners();
  }

  void setChewy(double value) {
    _chewy = value;
    notifyListeners();
  }

  void setElegant(double value) {
    _elegant = value;
    notifyListeners();
  }

  void setComplex(double value) {
    _complex = value;
    notifyListeners();
  }

  void setBakance(double value) {
    _bakance = value;
    notifyListeners();
  }

  void setLongFinish(double value) {
    _longFinish = value;
    notifyListeners();
  }

  void setThin(double value) {
    _thin = value;
    notifyListeners();
  }

  void setFullBodied(double value) {
    _fullBodied = value;
    notifyListeners();
  }

  void setBerrys(double value) {
    _berrys = value;
    notifyListeners();
  }

  void setFruitForward(double value) {
    _fruitForward = value;
    notifyListeners();
  }

  void setWineDetailResponse(WineDetailResponse value, BuildContext context) {
    _wineDetailResponse = value;
    Navigator.of(context).pushNamed('/wines_review');
    notifyListeners();
  }

  void setReviewListResponse(ReviewListResponse value) {
    _reviewListResponse = value;
    notifyListeners();
  }

  void setSubmitReviewResponse(SubmitReviewResponse value) {
    _submitReviewResponse = value;
    notifyListeners();
  }

  Future<void> callReviewOrder(int? userId, BuildContext context) async {
    EasyLoading.show(status: 'Please Wait...');
    SubmitReviewRequest submitReviewRequest = SubmitReviewRequest(
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

    final response =
        await submitReview(submitReviewRequest: submitReviewRequest);
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

  Future<void> callWinesReviewApi({required int userId}) async {
    EasyLoading.show(status: 'Please Wait...');
   // _winesList.clear();
    ReviewListRequest reviewListRequest = ReviewListRequest(userId: userId);

    final response = await getReviews(reviewListRequest: reviewListRequest);
    if (response != null) {
      setReviewListResponse(response);

      if (_reviewListResponse!.data!.getAllFeedbacks!.data!.isNotEmpty) {
        setWineReviewList(_reviewListResponse!.data!.getAllFeedbacks!.data!);
      }
      EasyLoading.dismiss();
     // return _reviewListResponse!.data!.getAllFeedbacks!.status!;
    } else {
      EasyLoading.dismiss();
     // return false;
    }
  }
}
