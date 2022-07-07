import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/models/responses/wineries_model.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class WineriesVerticalListWidget extends StatelessWidget {
  const WineriesVerticalListWidget({Key? key, required this.wineriesList, required this.listScrollable})
      : super(key: key);
  final bool listScrollable;
  final List<WineriesModel> wineriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: listScrollable == false? const NeverScrollableScrollPhysics() : null  ,
      itemCount: wineriesList.length,
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
                    SizedBox(
                      width: 80.w,
                      height: 150.h,
                      child: Image.asset(
                        '${wineriesList[index].image}',
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
                          children: [
                            GoogleFontText4(
                              data: '${wineriesList[index].title}',
                            ),
                            NormalFontText4(
                                data: '${wineriesList[index].description}'),
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
                                    data: '${wineriesList[index].closingTime}'),
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
