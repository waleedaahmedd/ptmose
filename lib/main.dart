import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view/splash.dart';

void main() {
  runApp(/*MultiProvider(
    providers: [
      *//*ChangeNotifierProvider(
        create: (context) => PostsNotifier(),
      ),*//*
    ],*/
  /*  child:*/ MyApp(),
/*  )*/);
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
            debugShowCheckedModeBanner: false,
            title: 'Welcome to Flutter',
            home: Splash(),

          );
        });
  }
}
