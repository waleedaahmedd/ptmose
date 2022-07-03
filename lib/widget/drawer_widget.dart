import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.purple,
      child: Column(
        //padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.purple,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.close,
                      color: CustomColors.golden,
                    ),
                    Expanded(
                        child: Center(
                            child: Image.asset(
                      'assets/images/Logo.png',
                      height: 20.h,
                    ))),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: NormalFontText3(
                    data: 'HELLO,',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    GoogleFontText3(
                      data: 'Paul Wilkins',
                    ),
                    Icon(
                      Icons.mode_edit_outlined,
                      color: CustomColors.golden,
                    )
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'MY RESERVATIONS',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'MY REVIEWS',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'SHOP',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'ABOUT PTMOSE',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'SETTINGS',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'LOGOUT',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
