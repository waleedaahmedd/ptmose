import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';

class FeaturedTestingCardWidget extends StatelessWidget {
  const FeaturedTestingCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Image.asset('assets/images/LocationBoxImg.png',
            width: double.infinity,
            fit: BoxFit.fill,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const NormalFontText5(data:'Vinous Reverie Wine Merchant'),
                SizedBox(height: 10.h,),
                const GoogleFontText5(data:'Alsace Grand Cru Riesling Tasting'),
                SizedBox(height: 10.h,),
                Row(
                  children:  [
                    Icon(Icons.calendar_month_rounded,color: CustomColors.purple,size: 15.h,),
                    SizedBox(width: 10.w,),
                    const NormalFontText4(data:'FEB 3'),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children:  [
                    Icon(Icons.watch_later_outlined,color: CustomColors.purple,size: 15.h,),
                    SizedBox(width: 10.w,),
                    const NormalFontText4(data:'5:00 PM - 7:00 PM PST'),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children:  [
                    Icon(Icons.location_on_outlined,color: CustomColors.purple,size: 15.h,),
                    SizedBox(width: 10.w,),
                    const NormalFontText4(data:'Vinous Reverie Winery, Walnut Creek, CA'),
                  ],
                ),
              ],
            ),
          )
        ],),
      ),
    );
  }
}
