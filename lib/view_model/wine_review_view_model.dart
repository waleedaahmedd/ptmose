import 'package:flutter/cupertino.dart';

import '../models/responses/wine_detail_response.dart';

class WineReviewViewModel with ChangeNotifier {
  TextEditingController detailController = TextEditingController();
  WineDetailResponse? _wineDetailResponse;
   int fruitForward = 0;
   int berrys = 0;
   int fullBodied = 0;
   int thin = 0;
   int longFinish = 0;
   int bakance = 0;
   int complex = 0;
   int elegant = 0;
   int chewy = 0;
   int soft = 0;
   int silky = 0;
   int burn = 0;
   int jammy = 0;
   int bellPepper = 0;
   int spicy = 0;
   int toasty = 0;
   int oak = 0;
   int vegetable = 0;
   int minerality = 0;
   int rubber = 0;
   int smoky = 0;
   int ageOfWine = 0;

  WineDetailResponse get getWineDetailResponse => _wineDetailResponse!;

  void setWineDetailResponse(WineDetailResponse value) {
    _wineDetailResponse = value;
    notifyListeners();
  }
}
