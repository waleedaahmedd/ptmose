import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../models/responses/wineries_model.dart';
import '../models/responses/wines_model.dart';
import '../utils/custom_font_style.dart';

class WinesHorizontalListWidget extends StatelessWidget {
  const WinesHorizontalListWidget(
      {Key? key, required this.winesList, required this.listScrollable})
      : super(key: key);
  final List<WinesModel> winesList;
  final bool listScrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.horizontal,
      itemCount: winesList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: 180.w,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/wines_details',arguments: true);
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0,left: 20, right: 20),
                      child: Image.asset(
                        '${winesList[index].image}',
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const GoogleFontText6(
                              data: 'Alsace Grand Cru Riesling Tasting'),
                          SizedBox(
                            height: 10.h,
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