import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

class Heading extends StatelessWidget {
  final String data;

  const Heading({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: TextStyle(fontSize: 30.sp, color: CustomColors.golden)),
    );
  }
}
