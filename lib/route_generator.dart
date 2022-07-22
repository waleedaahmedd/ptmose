import 'package:flutter/material.dart';
import 'package:ptmose/Screens/login_screen.dart';
import 'package:ptmose/Screens/my_reservation_screen.dart';
import 'package:ptmose/Screens/splash_screen.dart';
import 'package:ptmose/Screens/tasting_list_screen.dart';

import 'Screens/about_screen.dart';
import 'Screens/cart_screen.dart';
import 'Screens/forget_password_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/review_submition_screen.dart';
import 'Screens/shop_screen.dart';
import 'Screens/tasting_details_screen.dart';
import 'Screens/wine_review_screen.dart';
import 'Screens/wineries_list_screen.dart';
import 'Screens/winery_details_screen.dart';
import 'Screens/sign_up_screen.dart';
import 'Screens/wines_detail_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/login':
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());
      case '/forget_password':
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) =>  const SignUpScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());
      case '/wineryDetails':
        return MaterialPageRoute(builder: (_) =>   WineryDetailsScreen());
      case '/my_reservation':
        return MaterialPageRoute(builder: (_) =>  const MyReservationScreen());
      case '/tasting_list':
        return MaterialPageRoute(builder: (_) =>  const TastingListScreen());
      case '/wineries_list':
        return MaterialPageRoute(builder: (_) =>  const WineriesListScreen());
      case '/tasting_details':
        return MaterialPageRoute(builder: (_) =>  const TastingDetailsScreen(),settings : const RouteSettings(name: '/tasting_details'));
      case '/wines_details':
        return MaterialPageRoute(builder: (_) =>  WinesDetailScreen(reviewButton: args,));
      case '/wines_review':
        return MaterialPageRoute(builder: (_) =>  const WineReviewScreen());
      case '/review_submission':
        return MaterialPageRoute(builder: (_) =>  const ReviewSubmissionScreen());
      case '/shop':
        return MaterialPageRoute(builder: (_) =>  const ShopScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) =>  const CartScreen());
      case '/about':
        return MaterialPageRoute(builder: (_) =>  const AboutScreen());

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
