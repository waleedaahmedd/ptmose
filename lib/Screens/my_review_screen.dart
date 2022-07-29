import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/wine_review_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/review_vertical_list_widget.dart';

class MyReviewScreen extends StatefulWidget {
  const MyReviewScreen({Key? key}) : super(key: key);

  @override
  State<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<WineReviewViewModel>(context, listen: false)
          .callWinesReviewApi(
          userId:
          Provider.of<AuthViewModel>(context, listen: false)
              .getUserDataResponse
              .id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WineReviewViewModel>(builder: (_, wineReviewViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoogleFontText5(
                data: 'MY REVIEWS',
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ReviewVerticalListWidget(
                  listScrollable: true,
                  reviewList: wineReviewViewModel
                      .getWineReviewList,
                ),
              )
            ],
          ),
        ),
      );
    });  }
}


