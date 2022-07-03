import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_colors.dart';

//google fonts
//google font, color golden, size 30, w500
class GoogleFontText1 extends StatelessWidget {
  final String data;

  const GoogleFontText1({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: TextStyle(
              fontSize: 30.sp,
              color: CustomColors.golden,
              fontWeight: FontWeight.w500)),
    );
  }
}

//google font, color white, size 14
class GoogleFontText2 extends StatelessWidget {
  final String data;

  const GoogleFontText2({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: const TextStyle(color: Colors.white)),
    );
  }
}

//google font, color white, size 30
class GoogleFontText3 extends StatelessWidget {
  final String data;

  const GoogleFontText3({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: TextStyle(fontSize: 30.sp, color: Colors.white)),
    );
  }
}

//google font, color golden, size 20
class GoogleFontText4 extends StatelessWidget {
  final String data;

  const GoogleFontText4({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: TextStyle(fontSize: 20.sp, color: CustomColors.golden)),
    );
  }
}

//google font, color golden, size 25
class GoogleFontText5 extends StatelessWidget {
  final String data;

  const GoogleFontText5({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.montaguSlab(
          textStyle: TextStyle(fontSize: 25.sp, color: CustomColors.golden)),
    );
  }
}

//normal fonts
//normal font, color purple, size 15, bold
class NormalFontText1 extends StatelessWidget {
  final String data;

  const NormalFontText1({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          color: CustomColors.purple,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp),
    );
  }
}

//normal font, color purple, size 14
class NormalFontText2 extends StatelessWidget {
  final String data;

  const NormalFontText2({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(color: CustomColors.purple),
    );
  }
}

//normal font, color white, size 14, bold
class NormalFontText3 extends StatelessWidget {
  final String data;

  const NormalFontText3({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}


//normal font, color grey, size 14
class NormalFontText4 extends StatelessWidget {
  final String data;

  const NormalFontText4({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(color: Colors.grey),
    );
  }
}

//normal font, color purple, size 14, bold
class NormalFontText5 extends StatelessWidget {
  final String data;

  const NormalFontText5({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(color: CustomColors.purple,fontWeight: FontWeight.bold),
    );
  }
}


//normal font, color golden, size 15, bold
class NormalFontText6 extends StatelessWidget {
  final String data;

  const NormalFontText6({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:  TextStyle(color: CustomColors.golden, fontWeight: FontWeight.bold, fontSize: 15.sp),
    );
  }
}
