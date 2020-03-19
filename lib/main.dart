import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fumanyi_app/features/presentation/pages/game_page.dart';

import 'features/presentation/pages/language.dart';
import 'features/presentation/pages/splash_screen.dart';
import 'features/presentation/pages/walkthrough.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fumanyi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        //accentColor: Colors.cyan[600],
        //primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/language': (BuildContext context) => LanguagePage(),
      },
    );
  }
}
