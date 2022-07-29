import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/auth_view_model.dart';
import 'package:ptmose/view_model/wine_review_view_model.dart';

import '../utils/shared_pref .dart';
import '../utils/custom_font_style.dart';
import '../view_model/home_view_model.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();

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
                    IconButton(
                      color: CustomColors.golden,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
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
                  children: [
                    GoogleFontText3(
                      data: Provider.of<AuthViewModel>(context, listen: false)
                          .getUserName,
                    ),
                    const Icon(
                      Icons.mode_edit_outlined,
                      color: CustomColors.golden,
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Provider.of<AuthViewModel>(context, listen: false).getGuestUser
                    ? Navigator.of(context).pushNamed('/login')
                    : Navigator.of(context).pushNamed('/my_reservation');
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/mic.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'MY RESERVATIONS',
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context);
                Provider.of<AuthViewModel>(context, listen: false).getGuestUser
                    ? Navigator.of(context).pushNamed('/login')
                    : Navigator.of(context).pushNamed('/my_review');
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/star_2.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'MY REVIEWS',
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/shop');
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/vine.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'SHOP',
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/about');
                //Navigator.pushNamed(context, '/shop');
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/about.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'ABOUT PTMOSE',
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, '/shop');
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/setting_btn.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'SETTINGS',
                ),
              ]),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Provider.of<AuthViewModel>(context, listen: false).signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', ModalRoute.withName('/'));
              },
              child: Row(children: [
                Image.asset(
                  'assets/images/logout_btn.png',
                  height: 12.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                const GoogleFontText2(
                  data: 'LOGOUT',
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
