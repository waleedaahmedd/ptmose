class SubmitReviewRequest {
  final int fruitForward;
  final int berrys;
  final int fullBodied;
  final int thin;
  final int longFinish;
  final int bakance;
  final int complex;
  final int elegant;
  final int chewy;
  final int soft;
  final int silky;
  final int burn;
  final int jammy;
  final int bellPepper;
  final int spicy;
  final int toasty;
  final int oak;
  final int vegetable;
  final int minerality;
  final int rubber;
  final int smoky;
  final int ageOfWine;
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
