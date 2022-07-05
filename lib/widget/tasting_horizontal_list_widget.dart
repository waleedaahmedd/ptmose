import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/models/responses/tasting_model.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';

class TastingHorizontalListWidget extends StatelessWidget {
  const TastingHorizontalListWidget({
    Key? key,
    required this.tastingList,
  }) : super(key: key);
  final List<TastingModel> tastingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.horizontal,
      itemCount: tastingList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: SizedBox(
            width: 300.w,
            child: GestureDetector(
              onTap: () {
                //Navigator.of(context).pushNamed('/shop');
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
                    Image.asset(
                      '${tastingList[index].image}',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalFontText5(
                              data: '${tastingList[index].location}'),
                          SizedBox(
                            height: 10.h,
                          ),
                          GoogleFontText5(data: '${tastingList[index].title}'),
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
                                  data: '${tastingList[index].workingHours}'),
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
                              NormalFontText4(
                                  data: '${tastingList[index].address}'),
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