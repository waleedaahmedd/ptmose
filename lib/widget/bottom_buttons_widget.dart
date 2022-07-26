import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';

class BottomButtonsWidget extends StatelessWidget {
  const BottomButtonsWidget({Key? key, required this.homeScreen}) : super(key: key);
  final bool homeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
          width: double.infinity,
          height: 70.h,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    homeScreen?(){}:Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      decoration:  BoxDecoration(
                        color: homeScreen?CustomColors.purple:Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(
                            Icons.calendar_today_outlined,
                            color: homeScreen?Colors.white:CustomColors.golden,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          homeScreen? const NormalFontText3(
                            data: 'TASTINGS',
                          ):const NormalFontText6(
                            data: 'TASTINGS',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    homeScreen?
                    Navigator.pushNamed(context, '/shop'):(){};
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration:  BoxDecoration(
                          color: homeScreen?Colors.white:CustomColors.purple,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Icon(
                              Icons.account_balance_wallet_outlined,
                              color: homeScreen?CustomColors.golden:Colors.white,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            homeScreen?
                            const NormalFontText6(
                              data: 'SHOP',
                            ):const NormalFontText3(
                              data: 'SHOP',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
