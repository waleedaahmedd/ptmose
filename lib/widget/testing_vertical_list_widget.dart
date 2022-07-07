import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/models/responses/tasting_model.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class TestingVerticalListWidget extends StatelessWidget {
  const TestingVerticalListWidget({Key? key, required this.listScrollable, required this.tastingList}) : super(key: key);
  final bool listScrollable;
  final List<TastingModel> tastingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: listScrollable == false? const NeverScrollableScrollPhysics() : null  ,
      itemCount: tastingList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/wineryDetails');
            },
            child: SizedBox(
              width: double.infinity,
              height: 140.h,
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 140.h,
                      child: Image.asset(
                        '${tastingList[index].image}',
                        /*height: 65,*/
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalFontText5(
                                data: '${tastingList[index].location}'),
                            SizedBox(
                              height: 5.h,
                            ),
                            GoogleFontText4(data: '${tastingList[index].title}'),
                            SizedBox(
                              height: 5.h,
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
                                    data: '${tastingList[index].workingHours}'),
                              ],
                            ),
                           /* SizedBox(
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
                                NormalFontText4(
                                    data: '${tastingList[index].address}'),
                              ],
                            ),*/
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
