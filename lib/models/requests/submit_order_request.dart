import '../orderItemModel.dart';

class SubmitOrderRequest {
  final int userId;
  final int total;
  final String paymentId;
  final List<OrderItemModel> cartItems;

  SubmitOrderRequest(this.userId, this.cartItems, this.paymentId, this.total);


  generateQuery(){
    String query = '''{"query":"mutation Mutation(\$input: OrderInput!) {\\r\\n  createOrder(input: \$input) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"input":{"userId":4,"total":48,"paymentId":"","items":[{"wineId":9,"quantity":2,"amount":24}]}}}''';
    return query;
  }
}