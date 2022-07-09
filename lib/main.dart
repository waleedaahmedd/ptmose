import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/Screens/tasting_details_screen.dart';
import 'package:ptmose/route_generator.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/app_bar_view_model.dart';
import 'package:ptmose/view_model/forget_password_view_model.dart';
import 'package:ptmose/view_model/home_view_model.dart';
import 'package:ptmose/view_model/login_view_model.dart';
import 'package:ptmose/view_model/my_reservation_view_model.dart';
import 'package:ptmose/view_model/signup_view_model.dart';
import 'package:ptmose/view_model/tasting_details_view_model.dart';
import 'package:ptmose/view_model/testing_list_view_model.dart';
import 'package:ptmose/view_model/wineriesListViewModel.dart';
import 'package:ptmose/view_model/winery_details_view_model.dart';

import 'Screens/splash_screen.dart';

void main() {
  configLoading();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => SignUpViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ForgotPasswordViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => AppBarViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => WineryDetailsViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => TestingListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => WineriesListViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => MyReservationViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => TastingDetailsViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = CustomColors.golden
    ..backgroundColor = CustomColors.purple
    ..indicatorColor = CustomColors.golden
    ..textColor = CustomColors.golden
    ..maskColor = Colors.black.withOpacity(0.5)
    ..maskType = EasyLoadingMaskType.custom
    ..userInteractions = false
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: CustomColors.purple,
              colorScheme: ThemeData().colorScheme.copyWith(
                    secondary: CustomColors.purple,
                    primary: CustomColors.purple,
                  ),
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: CustomColors.purple, //<-- SEE HERE
              ),
              inputDecorationTheme: InputDecorationTheme(
                //suffixIconColor: CustomColors.purple,
                focusColor: CustomColors.purple,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                labelStyle: TextStyle(
                    color: CustomColors.golden,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.purple)),
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Welcome to PTMOSE',
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            builder: EasyLoading.init(),
          );
        });
  }
}
