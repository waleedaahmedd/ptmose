class SubmitReviewRequest {
  final num fruitForward;
  final num berrys;
  final num fullBodied;
  final num thin;
  final num longFinish;
  final num bakance;
  final num complex;
  final num elegant;
  final num chewy;
  final num soft;
  final num silky;
  final num burn;
  final num jammy;
  final num bellPepper;
  final num spicy;
  final num toasty;
  final num oak;
  final num vegetable;
  final num minerality;
  final num rubber;
  final num smoky;
  final num ageOfWine;
  final String comment;
  final int userId;
  final int wineId;

  SubmitReviewRequest(
      {required this.fruitForward,
      required this.userId,
      required this.ageOfWine,
      required this.bakance,
      required this.bellPepper,
      required this.berrys,
      required this.burn,
      required this.chewy,
      required this.comment,
      required this.complex,
      required this.elegant,
      required this.fullBodied,
      required this.jammy,
      required this.longFinish,
      required this.minerality,
      required this.oak,
      required this.rubber,
      required this.silky,
      required this.smoky,
      required this.soft,
      required this.spicy,
      required this.thin,
      required this.toasty,
      required this.vegetable,
      required this.wineId});

  generateQuery() {
    String query =
        '''{"query":"mutation AddFeedback(\$fruitForward: Float!, \$berrys: Float!, \$fullBodied: Float!, \$thin: Float!, \$longFinish: Float!, \$bakance: Float!, \$complex: Float!, \$elegant: Float!, \$chewy: Float!, \$soft: Float!, \$silky: Float!, \$burn: Float!, \$jammy: Float!, \$bellPepper: Float!, \$spicy: Float!, \$toasty: Float!, \$oak: Float!, \$vegetable: Float!, \$minerality: Float!, \$rubber: Float!, \$smoky: Float!, \$ageOfWine: Float!, \$comment: String!, \$userId: Int!, \$wineId: Int!) {\\r\\n  addFeedback(fruitForward: \$fruitForward, berrys: \$berrys, fullBodied: \$fullBodied, thin: \$thin, longFinish: \$longFinish, bakance: \$bakance, complex: \$complex, elegant: \$elegant, chewy: \$chewy, soft: \$soft, silky: \$silky, burn: \$burn, jammy: \$jammy, bellPepper: \$bellPepper, spicy: \$spicy, toasty: \$toasty, oak: \$oak, vegetable: \$vegetable, minerality: \$minerality, rubber: \$rubber, smoky: \$smoky, ageOfWine: \$ageOfWine, comment: \$comment, userId: \$userId, wineId: \$wineId) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"fruitForward":2,"berrys":2,"fullBodied":2,"thin":2,"longFinish":2,"bakance":2,"complex":2,"elegant":2,"chewy":2,"soft":2,"silky":2,"burn":2,"jammy":2,"bellPepper":2,"spicy":2,"toasty":2,"oak":2,"vegetable":2,"minerality":2,"rubber":2,"smoky":2,"ageOfWine":2,"comment":"sddwwd","userId":4,"wineId":9}}''';
    return query;
  }
}
