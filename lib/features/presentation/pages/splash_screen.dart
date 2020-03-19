import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    return Timer(Duration(seconds: 5),
            () => Navigator.of(context).pushReplacementNamed('/language'), // '/home'
    );
  }

  @override
  void initState() {
    super.initState();

    ///SplashScreen
    startTime();

    ///Fade
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: -1.0,
      end: 7.0,
    ).animate(animationController);

    animationController.forward();
  }

  ///Background color
  static const color = const Color(0xff017246);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: <Widget>[
          Center(
            child: FadeTransition(
              opacity: animation,
              child: Image.asset('assets/icons/Fumanyi.png', height: 338.0, width: 184.0),
            ),
          ),
        ],
      ),
    );
  }
}