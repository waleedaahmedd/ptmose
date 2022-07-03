import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class WineriesCardWidget extends StatelessWidget {
  const WineriesCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170.h,
      child: Card(
        elevation: 10,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/WineBottles/WineBottlePic1.png',
              /*height: 65,*/
              width: 100,
              fit: BoxFit.fill,
            ),
             Expanded(
               child: Padding(
                padding:  const EdgeInsets.all(20.0),
                child: Column(
                  children:  [
                    const GoogleFontText4(
                      data: 'Vinous Reverie Wine Merchant',
                    ),
                    SizedBox(height: 10.w,),
                    const NormalFontText4(data:'Specializes in still & sparkling wines, with a French-inspired chateau & formal gardens'),
                    SizedBox(height: 20.h,),
                    Row(
                      children:  [
                        Icon(Icons.watch_later_outlined,color: CustomColors.purple,size: 15.h,),
                        SizedBox(width: 10.w,),
                        const NormalFontText4(data:'5:00 PM - 7:00 PM PST'),
                      ],
                    ),
                  ],
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
