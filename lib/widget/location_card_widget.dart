import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_font_style.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({Key? key, required this.name, required this.image}) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60.h,
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
             Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GoogleFontText4(data:name,),
            ),
            Image.asset(image,/*height: 65,*/
              fit: BoxFit.fill,)
          ],),
      ),
    );
  }
}
