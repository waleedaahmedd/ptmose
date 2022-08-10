import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';

//google fonts
//google font, color golden, size 25, w400
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
      style: TextStyle(
          fontFamily: 'MontaguSlab',
          fontSize: 25.sp,
          color: CustomColors.golden,
          fontWeight: FontWeight.w400),
    );
  }
}

//google font, color white, size 12
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
      style: TextStyle(
          color: Colors.white, fontFamily: 'MontaguSlab', fontSize: 12.sp),
    );
  }
}

//google font, color white, size 25
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
      style: TextStyle(
        fontSize: 25.sp,
        color: Colors.white,
        fontFamily: 'MontaguSlab',
      ),
    );
  }
}

//google font, color golden, size 16
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
      style: TextStyle(
        fontSize: 16.sp,
        color: CustomColors.golden,
        fontFamily: 'MontaguSlab',
      ),
    );
  }
}

//google font, color golden, size 18
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
      style: TextStyle(
        fontSize: 18.sp,
        color: CustomColors.golden,
        fontFamily: 'MontaguSlab',
      ),
    );
  }
}

//google font, color golden, size 14, align center
class GoogleFontText6 extends StatelessWidget {
  final String data;

  const GoogleFontText6({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.sp,
        color: CustomColors.golden,
        fontFamily: 'MontaguSlab',
      ),
    );
  }
}

//normal fonts
//normal font, color purple, size 14, bold
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
          fontSize: 14.sp),
    );
  }
}

//normal font, color purple, size 12
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
      style: TextStyle(color: CustomColors.purple, fontSize: 12.sp),
    );
  }
}

//normal font, color white, size 12, bold
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
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
    );
  }
}

//normal font, color grey, size 12
class NormalFontText4 extends StatelessWidget {
  final String data;

  const NormalFontText4({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        overflow: TextOverflow.ellipsis,
        maxLines: 3);
  }
}

//normal font, color purple, size 12, w800
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
      style: TextStyle(
          color: CustomColors.purple,
          fontWeight: FontWeight.w800,
          fontSize: 12.sp),
    );
  }
}

//normal font, color golden, size 12, bold
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
      style: TextStyle(
          color: CustomColors.golden,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp),
    );
  }
}

//normal font, color white, size 12
class NormalFontText7 extends StatelessWidget {
  final String data;

  const NormalFontText7({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: Colors.white, fontSize: 12.sp),
    );
  }
}

//normal font, color purple, size 16, bold
class NormalFontText8 extends StatelessWidget {
  final String data;

  const NormalFontText8({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: CustomColors.purple,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp),
    );
  }
}
