import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/route_generator.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/forget_password_view_model.dart';
import 'package:ptmose/view_model/login_view_model.dart';
import 'package:ptmose/view_model/signup_view_model.dart';

import 'Screens/splash.dart';

void main() {
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
    ],
    child: MyApp(),
  ));
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
          );
        });
  }
}
