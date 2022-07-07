import 'package:flutter/material.dart';
import 'package:ptmose/Screens/login_screen.dart';
import 'package:ptmose/Screens/my_reservation_screen.dart';
import 'package:ptmose/Screens/splash_screen.dart';
import 'package:ptmose/Screens/tasting_list_screen.dart';

import 'Screens/forget_password_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/winery_details_screen.dart';
import 'Screens/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/login':
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case '/forget_password':
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case '/wineryDetails':
        return MaterialPageRoute(builder: (_) =>  WineryDetailsScreen());
      case '/my_reservation':
        return MaterialPageRoute(builder: (_) =>  MyReservationScreen());
      case '/tasting_list':
        return MaterialPageRoute(builder: (_) =>  TastingListScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something wrong in routes'),
        ),
      );
    });
  }
}
