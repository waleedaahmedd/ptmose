import 'package:flutter/material.dart';
import 'package:ptmose/Screens/login.dart';
import 'package:ptmose/Screens/splash.dart';

import 'Screens/forget_password.dart';
import 'Screens/home.dart';
import 'Screens/shop.dart';
import 'Screens/sign_up.dart';

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
      case '/shop':
        return MaterialPageRoute(builder: (_) =>  ShopScreen());
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
