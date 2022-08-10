class StripePaymentRequest {
  final int amount;
  final int userId;

  StripePaymentRequest({required this.amount, required this.userId});

  generateQuery() {
    String query =
    '''{"query":"mutation Mutation(\$userId: Int!, \$amount: Int!) {\\r\\n  createPaymentIntent(userId: \$userId, amount: \$amount) {\\r\\n    status\\r\\n    message\\r\\n    data {\\r\\n      paymentIntentId\\r\\n      stripeCustomerId\\r\\n      client_secret\\r\\n    }\\r\\n  }\\r\\n}","variables":{"userId":$userId,"amount":$amount}}''';
    return query;
  }
}