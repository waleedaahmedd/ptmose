class OrderItemModel {
  int? wineId;
  int? quantity;
  int? amount;

  OrderItemModel({this.wineId, this.quantity, this.amount});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    wineId = json['wineId'];
    quantity = json['quantity'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wineId'] = wineId;
    data['quantity'] = quantity;
    data['amount'] = amount;
    return data;
  }
}