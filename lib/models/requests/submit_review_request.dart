class SubmitReviewRequest {
  final double fruitForward;
  final double berrys;
  final double fullBodied;
  final double thin;
  final double longFinish;
  final double bakance;
  final double complex;
  final double elegant;
  final double chewy;
  final double soft;
  final double silky;
  final double burn;
  final double jammy;
  final double bellPepper;
  final double spicy;
  final double toasty;
  final double oak;
  final double vegetable;
  final double minerality;
  final double rubber;
  final double smoky;
  final double ageOfWine;
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
        '''{"query":"mutation AddFeedback(\$fruitForward: Float!, \$berrys: Float!, \$fullBodied: Float!, \$thin: Float!, \$longFinish: Float!, \$bakance: Float!, \$complex: Float!, \$elegant: Float!, \$chewy: Float!, \$soft: Float!, \$silky: Float!, \$burn: Float!, \$jammy: Float!, \$bellPepper: Float!, \$spicy: Float!, \$toasty: Float!, \$oak: Float!, \$vegetable: Float!, \$minerality: Float!, \$rubber: Float!, \$smoky: Float!, \$ageOfWine: Float!, \$comment: String!, \$userId: Int!, \$wineId: Int!) {\\r\\n  addFeedback(fruitForward: \$fruitForward, berrys: \$berrys, fullBodied: \$fullBodied, thin: \$thin, longFinish: \$longFinish, bakance: \$bakance, complex: \$complex, elegant: \$elegant, chewy: \$chewy, soft: \$soft, silky: \$silky, burn: \$burn, jammy: \$jammy, bellPepper: \$bellPepper, spicy: \$spicy, toasty: \$toasty, oak: \$oak, vegetable: \$vegetable, minerality: \$minerality, rubber: \$rubber, smoky: \$smoky, ageOfWine: \$ageOfWine, comment: \$comment, userId: \$userId, wineId: \$wineId) {\\r\\n    status\\r\\n    message\\r\\n  }\\r\\n}","variables":{"fruitForward":$fruitForward,"berrys":$berrys,"fullBodied":$fullBodied,"thin":$thin,"longFinish":$longFinish,"bakance":$bakance,"complex":$complex,"elegant":$elegant,"chewy":$chewy,"soft":$soft,"silky":$silky,"burn":$burn,"jammy":$jammy,"bellPepper":$bellPepper,"spicy":$spicy,"toasty":$toasty,"oak":$oak,"vegetable":$vegetable,"minerality":$minerality,"rubber":$rubber,"smoky":$smoky,"ageOfWine":$ageOfWine,"comment":"$comment","userId":$userId,"wineId":$wineId}}''';
    return query;
  }
}
