import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/auth_view_model.dart';

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
                      data: Provider.of<AuthViewModel>(context, listen: false).getUserName,
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
          ListTile(
            leading: const Icon(
              Icons.ac_unit,
              color: CustomColors.golden,
            ),
            title: const GoogleFontText2(
              data: 'MY RESERVATIONS',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/my_reservation');
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
              Navigator.pushNamed(context, '/shop');
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
              sharedPref.remove('userData');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
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
