import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/cart_view_model.dart';
import '../view_model/wine_review_view_model.dart';
import '../widget/app_bar_widget.dart';

class MyReviewDetailScreen extends StatelessWidget {
  const MyReviewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WineReviewViewModel>(builder: (_, wineReviewViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Provider.of<CartViewModel>(context, listen: false)
                      .callWineDetails(wineReviewViewModel.getReviewListResponse
                      .data!
                      .getAllFeedbacks!
                      .data![wineReviewViewModel.getReviewIndex]
                      .wine!.id)
                      .then((value) => Navigator.of(context)
                      .pushNamed('/wines_details', arguments: false));
                },
                child: SizedBox(
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
                              wineReviewViewModel
                                  .getReviewListResponse
                                  .data!
                                  .getAllFeedbacks!
                                  .data![wineReviewViewModel.getReviewIndex]
                                  .wine!
                                  .image!,
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
                                  data: wineReviewViewModel
                                      .getReviewListResponse
                                      .data!
                                      .getAllFeedbacks!
                                      .data![wineReviewViewModel.getReviewIndex]
                                      .wine!
                                      .wineName!,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                NormalFontText5(
                                    data: wineReviewViewModel
                                        .getReviewListResponse
                                        .data!
                                        .getAllFeedbacks!
                                        .data![wineReviewViewModel.getReviewIndex]
                                        .wine!
                                        .wineType!),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: NormalFontText5(
                                          data: wineReviewViewModel
                                              .getReviewListResponse
                                              .data!
                                              .getAllFeedbacks!
                                              .data![wineReviewViewModel.getReviewIndex]
                                              .wine!
                                              .age!
                                              .toString()),
                                    ),
                                    const NormalFontText5(
                                        data:'SHOP NOW'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .fruitForward!
                                .toDouble(),
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .berrys!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .fullBodied!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .thin!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .longFinish!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .bakance!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .complex!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .elegant!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .chewy!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .soft!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .silky!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .burn!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .jammy!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .bellPepper!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .spicy!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .toasty!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .oak!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .vegetable!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .minerality!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .rubber!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .smoky!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                            ignoreGestures: true,
                            unratedColor: CustomColors.tintPurple,
                            glow: false,
                            itemSize: 25,
                            initialRating: wineReviewViewModel
                                .getReviewListResponse
                                .data!
                                .getAllFeedbacks!
                                .data![wineReviewViewModel.getReviewIndex]
                                .ageOfWine!
                                .toDouble(),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: CustomColors.golden,
                            ),
                            onRatingUpdate: (rating) {},
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
                        height: 10.h,
                      ),
                      NormalFontText2(data: '${wineReviewViewModel
                          .getReviewListResponse
                          .data!
                          .getAllFeedbacks!
                          .data![wineReviewViewModel.getReviewIndex].comment}',),
                      SizedBox(
                        height: 20.h,
                      ),
                    /*  TextField(
                        maxLines: 10,
                        maxLength: 500,
                        controller: wineReviewViewModel.detailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'PLEASE ANSWER HERE',
                          *//* errorText:
                            wineReviewViewModel.detailController.text.isEmpty
                                ? 'Please Fill Details'
                                : null*//*
                        ),
                      ),*/
                      /*SizedBox(
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
                            */ /* Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/review_submission',
                                (route) =>
                                    route.settings.name == "/tasting_list");*/ /*
                          })*/
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
