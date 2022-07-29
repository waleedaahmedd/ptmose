import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/responses/review_list_response.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/wine_review_view_model.dart';

class ReviewVerticalListWidget extends StatelessWidget {
  const ReviewVerticalListWidget(
      {Key? key, required this.reviewList, required this.listScrollable})
      : super(key: key);

  final bool listScrollable;
  final List<GetAllFeedbacksData> reviewList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      itemCount: reviewList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<WineReviewViewModel>(context, listen: false)
                  .setReviewIndex(index);
              Navigator.of(context).pushNamed('/my_review_Details');

              /*   Provider.of<CartViewModel>(context, listen: false)
                  .callWineDetails(reviewList[index].id)
                  .then((value) => Navigator.of(context)
                  .pushNamed('/wines_details', arguments: false));*/
            },
            child: SizedBox(
              width: double.infinity,
              height: 100.h,
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 20),
                          child: Center(
                            child: Image.network(
                              '${reviewList[index].wine!.image}',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GoogleFontText4(
                                  data: '${reviewList[index].wine!.wineName}',
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        NormalFontText5(
                                            data:
                                                '${reviewList[index].wine!.wineType}'),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        NormalFontText2(
                                            data:
                                                '${reviewList[index].wine!.age}'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          color: CustomColors.golden,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20),
                            child: NormalFontText5(
                                data:
                                    '\$ ${reviewList[index].wine!.price!.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
