import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/widget/custom_button_1.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/cart_view_model.dart';
import '../view_model/wine_review_view_model.dart';
import '../widget/app_bar_widget.dart';

class WineReviewScreen extends StatefulWidget {
  const WineReviewScreen({Key? key}) : super(key: key);

  @override
  State<WineReviewScreen> createState() => _WineReviewScreenState();
}

class _WineReviewScreenState extends State<WineReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WineReviewViewModel>(builder: (_, wineReviewViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          homeButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100.h,
                child: Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20),
                        child: Center(
                          child: Image.network(
                            wineReviewViewModel.getWineDetailResponse.data!
                                .getWineById!.data!.image!,
                            width: 30.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GoogleFontText4(
                                data: wineReviewViewModel.getWineDetailResponse
                                    .data!.getWineById!.data!.wineName!,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              NormalFontText5(
                                  data: wineReviewViewModel
                                      .getWineDetailResponse
                                      .data!
                                      .getWineById!
                                      .data!
                                      .wineType!),
                              SizedBox(
                                height: 10.h,
                              ),
                              NormalFontText5(
                                  data: wineReviewViewModel
                                      .getWineDetailResponse
                                      .data!
                                      .getWineById!
                                      .data!
                                      .age!
                                      .toString()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const GoogleFontText1(
                        data: 'Review',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'FRUIT FORWARD',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setFruitForward(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'BERRYS',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setBerrys(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'FULL-BODIED',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setFullBodied(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'THIN',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setThin(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'LONG FINISH',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setLongFinish(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'BALANCE',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setBakance(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'COMPLEX',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setComplex(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'ELEGANT',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setElegant(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'CHEWY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setChewy(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'SOFT',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setSoft(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'SILKY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setSilky(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'BURN',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setBurn(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'JAMMY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setJammy(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'BELL PEPPER',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setBellpepper(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'SPICY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setSpicy(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'TOASTY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setToasty(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'OAK',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setOak(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'VEGETABLE',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setVegetable(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'MINERALITY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setMinerality(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'RUBBER',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setRubber(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'SMOKY',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setSmoky(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: NormalFontText5(
                            data: 'AGE OF WINE',
                          )),
                          RatingBar.builder(
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                              wineReviewViewModel.setAgeOfWine(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      const NormalFontText5(
                        data: 'DETAIL REVIEW OF WINES AND WINERY EXPERIENCE.',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 10,
                        maxLength: 500,
                        controller: wineReviewViewModel.detailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'PLEASE ANSWER HERE',
                          /* errorText:
                            wineReviewViewModel.detailController.text.isEmpty
                                ? 'Please Fill Details'
                                : null*/
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButton1(
                          text: 'SUBMIT REVIEW',
                          onPressed: () {
                            wineReviewViewModel.callReviewOrder(
                                Provider.of<AuthViewModel>(context,
                                        listen: false)
                                    .getUserDataResponse
                                    .id,
                                context);
                            /* Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/review_submission',
                                (route) =>
                                    route.settings.name == "/tasting_list");*/
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
