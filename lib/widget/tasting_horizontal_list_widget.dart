import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../models/responses/tastings_response.dart';
import '../models/responses/wineries_and_testing_response.dart';
import '../utils/custom_font_style.dart';
import '../view_model/tasting_details_view_model.dart';
import '../view_model/winery_details_view_model.dart';

class TastingHorizontalListWidget extends StatelessWidget {
  const TastingHorizontalListWidget(
      {Key? key,
      required this.tastingList,
      required this.listScrollable,
      required this.onTapTastingDetails})
      : super(key: key);
  final List<Tastings> tastingList;
  final bool listScrollable;
  final Function onTapTastingDetails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.horizontal,
      itemCount: tastingList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
            width: 250.w,
            child: GestureDetector(
              onTap: () {
                onTapTastingDetails();
                Provider.of<TastingDetailsViewModel>(context, listen: false)
                    .callTastingDetails(tastingList[index].id)
                    .then((value) =>
                        Navigator.of(context).pushNamed('/tasting_details'));

                /* : Navigator.of(context).pushReplacementNamed('/shop');*/
              },
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      '${tastingList[index].img}',
                      width: double.infinity,
                      height: 115.h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalFontText5(
                              data: '${tastingList[index].merchantName}'),
                          SizedBox(
                            height: 10.h,
                          ),
                          GoogleFontText5(
                              data: '${tastingList[index].tastingName}'),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_rounded,
                                color: CustomColors.purple,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText4(
                                  data: '${tastingList[index].date}'),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: CustomColors.purple,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              NormalFontText4(
                                  data:
                                      '${tastingList[index].startTime} - ${tastingList[index].endTime} PST'),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: CustomColors.purple,
                                size: 15.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: NormalFontText4(
                                    data: '${tastingList[index].locationName}'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
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
