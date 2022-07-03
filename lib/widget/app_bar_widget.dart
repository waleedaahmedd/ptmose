import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/app_bar_view_model.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key, this.homeButton, this.cartButton, this.headings,

  }) : super(key: key);

  final bool? homeButton;
  final bool? cartButton;
  final bool? headings;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppBarViewModel>(
      builder: (_, appBarViewModel, __) {
        return AppBar(
          actions: [
            Visibility(
              visible: cartButton?? false,
              child: Badge(
                position: BadgePosition.topEnd(top: 5, end: 4),
                badgeContent: GoogleFontText2(
                  data: appBarViewModel.cartCount,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
            Visibility(
              visible: homeButton?? false,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.home_outlined),
              ),
            ),
            const SizedBox(width: 15),
          ],
          bottom: headings == null? null : const AppBarHeading(),
          iconTheme: const IconThemeData(
            size: 20, //change size on your need
            color: CustomColors.purple, //change color on your need
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/images/Logo3.png',
            height: 20.h,
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(headings == null? kToolbarHeight : 130.0.h /*kToolbarHeight*/);
}

class AppBarHeading extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: NormalFontText1(
              data: 'HELLO,',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              GoogleFontText1(
                data: 'Paul Wilkins',
              ),
              Icon(
                Icons.search,
                color: CustomColors.golden,
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
