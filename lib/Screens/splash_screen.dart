import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/auth_response/user_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../models/responses/auth_response/login_response.dart';
import '../utils/shared_pref .dart';
import '../view_model/auth_view_model.dart';
import 'login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late VideoPlayerController _controller;
  bool _visible = false;

  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller =
        VideoPlayerController.asset("assets/videos/splash-videos.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });

    Future.delayed(const Duration(seconds: 9), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('userData')) {
        UserDataResponse user = UserDataResponse.fromJson(await sharedPref.read("userData"));
        Provider.of<AuthViewModel>(context, listen: false).setUserDataResponse(user);
        Provider.of<AuthViewModel>(context, listen: false).callUserName();
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/'));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      //_controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: VideoPlayer(_controller),
    );
  }

/*
  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
    );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
          ],
        ),
      ),
    );
  }
}
