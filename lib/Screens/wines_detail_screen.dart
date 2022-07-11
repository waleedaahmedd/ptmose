import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';
import '../view_model/cart_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/custom_button_1.dart';
import '../widget/custom_button_2.dart';

class WinesDetailScreen extends StatefulWidget {
  const WinesDetailScreen({Key? key, required this.reviewButton})
      : super(key: key);
  final reviewButton;

  @override
  State<WinesDetailScreen> createState() => _WinesDetailScreenState();
}

class _WinesDetailScreenState extends State<WinesDetailScreen> {
  int quantityCount = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (_, cartViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 150.h,
                    child: Center(
                        child: Image.asset(
                            'assets/images/WineBottles/WineBottlePic1.png'))),
                SizedBox(
                  height: 40.h,
                ),
                const GoogleFontText5(
                  data: 'Cline Family Cellars \'Farmhouse Red\'',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const NormalFontText5(
                  data: 'Sonoma, CA 2018',
                ),
                SizedBox(
                  height: 20.h,
                ),
                const NormalFontText5(
                  data: 'ABOUT THE WINE',
                ),
                SizedBox(
                  height: 10.h,
                ),
                const NormalFontText4(
                  data:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                ),
                SizedBox(
                  height: 20.h,
                ),
                Visibility(
                  visible: widget.reviewButton,
                  child: Column(
                    children: [
                      CustomButton2(
                        text: 'HOW\'D YOU LIKE IT ?',
                        onPressed: () {
                          Navigator.of(context).pushNamed('/wines_review');
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: CustomColors.tintGolden,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0))),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: CustomColors.tintPurple,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantityCount > 1) {
                                    setState(() {
                                      quantityCount = --quantityCount;
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: const BoxDecoration(
                                      color: CustomColors.purple,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Center(
                                      child: NormalFontText1(
                                data: '$quantityCount',
                              ))),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantityCount = ++quantityCount;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 19, vertical: 10),
                                  decoration: const BoxDecoration(
                                      color: CustomColors.purple,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButton1(
                          text: 'ADD TO CART',
                          onPressed: () {
                            EasyLoading.show(status: 'Please Wait..');
                            cartViewModel.addCartCount();
                            EasyLoading.showSuccess('Wine Added Successfully');
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
