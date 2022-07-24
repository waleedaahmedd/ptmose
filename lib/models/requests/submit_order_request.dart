import 'dart:convert';

import '../orderItemModel.dart';

class SubmitOrderRequest {
  final int userId;
  final int total;
  final String paymentId;
  final String cartItems;

  SubmitOrderRequest(this.userId, this.cartItems, this.paymentId, this.total);

  //[{"wineId":8,"quantity":1,"amount":45}]
  generateQuery(){
    String query = '''{"query":"mutation Mutation(\$input: OrderInput!) {\\r\\n  createOrder(input: \$input) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}\\r\\n","variables":{"input":{"total":$total,"userId":$userId,"paymentId":"","items":$cartItems}}}''';
    print(query);
    return query;
  }
}