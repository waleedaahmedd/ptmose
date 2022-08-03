import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/Screens/tasting_details_screen.dart';
import 'package:ptmose/route_generator.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/cart_view_model.dart';
import 'package:ptmose/view_model/forget_password_view_model.dart';
import 'package:ptmose/view_model/home_view_model.dart';
import 'package:ptmose/view_model/auth_view_model.dart';
import 'package:ptmose/view_model/locations_view_model.dart';
import 'package:ptmose/view_model/my_reservation_view_model.dart';
import 'package:ptmose/view_model/shop_view_model.dart';
import 'package:ptmose/view_model/tasting_details_view_model.dart';
import 'package:ptmose/view_model/testing_list_view_model.dart';
import 'package:ptmose/view_model/wine_review_view_model.dart';
import 'package:ptmose/view_model/wineriesListViewModel.dart';
import 'package:ptmose/view_model/winery_details_view_model.dart';

import 'Screens/splash_screen.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  FirebaseMessaging.onBackgroundMessage(_messageHandler);


  configLoading();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ForgotPasswordViewModel(),
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
      ChangeNotifierProvider(
        create: (_) => WineReviewViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => CartViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ShopViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => LocationsViewModel(),
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
