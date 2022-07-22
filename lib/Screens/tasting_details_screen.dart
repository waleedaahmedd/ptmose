import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/winery_details_view_model.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/tasting_details_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/tasting_horizontal_list_widget.dart';
import '../widget/wines_horizontal_list_widget.dart';
import '../widget/wines_vertical_list_widget.dart';

class TastingDetailsScreen extends StatefulWidget {
  const TastingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TastingDetailsScreen> createState() => _TastingDetailsScreenState();
}

class _TastingDetailsScreenState extends State<TastingDetailsScreen> {
  /* @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<TastingDetailsViewModel>(
        builder: (_, tastingDetailsViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          homeButton: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                tastingDetailsViewModel
                    .getTastingsDetailResponse.data!.getTastingById!.data!.img!,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20.h),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalFontText5(
                          data: tastingDetailsViewModel
                              .getTastingsDetailResponse
                              .data!
                              .getTastingById!
                              .data!
                              .merchantName!,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GoogleFontText5(
                          data: tastingDetailsViewModel
                              .getTastingsDetailResponse
                              .data!
                              .getTastingById!
                              .data!
                              .tastingName!,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AuthViewModel>(context,
                                              listen: false)
                                          .getGuestUser
                                      ? Navigator.of(context)
                                          .pushNamed('/login')
                                      : tastingDetailsViewModel
                                          .callReserveTasting(
                                              Provider.of<AuthViewModel>(
                                                      context,
                                                      listen: false)
                                                  .getUserDataResponse
                                                  .id!);
                                },
                                child: Card(
                                    color: CustomColors.purple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20.0),
                                      child: Center(
                                          child: NormalFontText3(
                                        data: 'RESERVE',
                                      )),
                                    )),
                              ),
                            ),
                            Card(
                                color: CustomColors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Center(
                                      child: Icon(
                                    Icons.calendar_today_outlined,
                                    size: 15,
                                    color: Colors.white,
                                  )),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: CustomColors.tintPurple,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: NormalFontText5(
                            data: 'REVIEW THE WINES',
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //TODO: call List
                        SizedBox(
                          height: 211.h,
                          width: double.infinity,
                          child: tastingDetailsViewModel.getWinesList.isNotEmpty?WinesHorizontalListWidget(
                            listScrollable: true,
                            winesList: tastingDetailsViewModel.getWinesList,
                          ):const Center(
                            child: NormalFontText1(
                              data: 'Sorry Currently No Wines Found',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: CustomColors.purple,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NormalFontText6(
                            data: 'ABOUT THE EVENT',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          NormalFontText7(
                            data: tastingDetailsViewModel
                                .getTastingsDetailResponse
                                .data!
                                .getTastingById!
                                .data!
                                .about!,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: CustomColors.golden,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText7(
                                  data: tastingDetailsViewModel
                                      .getTastingsDetailResponse
                                      .data!
                                      .getTastingById!
                                      .data!
                                      .date!),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: CustomColors.golden,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText7(
                                  data:
                                      '${tastingDetailsViewModel.getTastingsDetailResponse.data!.getTastingById!.data!.startTime} - ${tastingDetailsViewModel.getTastingsDetailResponse.data!.getTastingById!.data!.endTime} PST'),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: CustomColors.golden,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText7(
                                  data: tastingDetailsViewModel
                                      .getTastingsDetailResponse
                                      .data!
                                      .getTastingById!
                                      .data!
                                      .locationName!),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.people_outline_outlined,
                                color: CustomColors.golden,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText7(
                                  data:
                                      '${tastingDetailsViewModel.getTastingsDetailResponse.data!.getTastingById!.data!.tastingReservers!.length} Attendees'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
