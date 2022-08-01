import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/tastings_response.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/tasting_details_view_model.dart';
import '../view_model/winery_details_view_model.dart';

class TestingVerticalListWidget extends StatelessWidget {
  const TestingVerticalListWidget(
      {Key? key,
      required this.listScrollable,
      required this.tastingList,
      required this.onTapTastingDetails})
      : super(key: key);
  final bool listScrollable;
  final List<Tastings> tastingList;
  final Function onTapTastingDetails;

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      itemCount: tastingList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              onTapTastingDetails();
              Provider.of<TastingDetailsViewModel>(context, listen: false)
                  .callTastingDetails(tastingList[index].id)
                  .then((value) =>
                      Navigator.of(context).pushNamed('/tasting_details'));
            },
            child: SizedBox(
              width: double.infinity,
              height: 150.h,
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Image.network(
                      '${tastingList[index].img}',
                      height: 150.h,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalFontText5(
                                data: '${tastingList[index].merchantName}'),
                            SizedBox(
                              height: 2.h,
                            ),
                            GoogleFontText4(
                                data: '${tastingList[index].tastingName}'),
                            SizedBox(
                              height: 2.h,
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
                              height: 2.h,
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
                              height: 2.h,
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
                                      data:
                                          '${tastingList[index].locationName}'),
                                ),
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
        );
      },
    );
  }
}
