import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_font_style.dart';

import '../utils/custom_colors.dart';
import '../widget/app_bar_widget.dart';
import '../widget/bottom_buttons_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/featured_testing_card_widget.dart';
import '../widget/location_card_widget.dart';
import '../widget/wineries_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          headings: true,
          cartButton: true,
        ),
        drawer: const DrawerWidget(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NormalFontText1(
                          data: 'LOCATION',
                        ),
                        NormalFontText2(
                          data: 'CHANGE',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const LocationCardWidget(
                      name: 'Napa Country',
                      image: 'assets/images/LocationBoxImg.png',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        NormalFontText1(
                          data: 'FEATURED TASTING',
                        ),
                        NormalFontText2(
                          data: 'SEE ALL >',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: call List
                    const FeaturedTestingCardWidget(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const NormalFontText1(
                      data: 'WINERIES',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: call List
                    const WineriesCardWidget(),
                  ],
                ),
              ),
            ),
            const BottomButtonsWidget()
          ],
        ),
        );
  }
}
