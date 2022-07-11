import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_font_style.dart';

class WineriesWidget extends StatelessWidget {
  const WineriesWidget({Key? key, required this.name, required this.image}) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            NormalFontText1(
              data: 'WINERY',
            ),
            NormalFontText2(
              data: 'CHANGE',
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 80.h,
          width: double.infinity,
          child: Card(
            elevation: 10,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GoogleFontText4(data:name,),
                  ),
                ),
                SizedBox(
                  height: 150.h,
                  width: 100.w,
                  child: Image.asset(image,/*height: 65,*/
                    fit: BoxFit.cover,),
                )
              ],),
          ),
        ),
      ],
    );
  }
}
