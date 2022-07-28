import 'dart:convert';

import '../orderItemModel.dart';

class ReviewListRequest {
  final int userId;


  ReviewListRequest({required this.userId});

  //[{"wineId":8,"quantity":1,"amount":45}]
  generateQuery(){
    String query = '''{"query":"query GetAllFeedbacks(\$feedBackInput: FeedBackInput) {\\r\\n  getAllFeedbacks(FeedBackInput: \$feedBackInput) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      fruitForward\\r\\n      berrys\\r\\n      fullBodied\\r\\n      thin\\r\\n      longFinish\\r\\n      bakance\\r\\n      complex\\r\\n      elegant\\r\\n      chewy\\r\\n      soft\\r\\n      silky\\r\\n      burn\\r\\n      jammy\\r\\n      bellPepper\\r\\n      spicy\\r\\n      toasty\\r\\n      oak\\r\\n      vegetable\\r\\n      minerality\\r\\n      rubber\\r\\n      smoky\\r\\n      ageOfWine\\r\\n      comment\\r\\n      Wine {\\r\\n        id\\r\\n        age\\r\\n        wineName\\r\\n        wineType\\r\\n        price\\r\\n        image\\r\\n      }\\r\\n    }\\r\\n  }\\r\\n}","variables":{"feedBackInput":{"userId":$userId}}}''';
    print(query);
    return query;
  }
}