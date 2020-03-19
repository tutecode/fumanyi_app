import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fumanyi_app/features/presentation/pages/walkthrough.dart';
import 'package:fumanyi_app/features/presentation/utils/text_styles.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/background_weed_black.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color(0xff017246),
            elevation: 0,
            title: Text(
              'Elige el idioma',
              style: appBar,
              textScaleFactor: 1.2,
            ),
          ),
          body: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 19.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppTutorial()));
                        },
                        color: const Color(0xff017246),
                        child: Text(
                          "Español",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            fontFamily: 'Segoe UI Italic',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 19.0,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppTutorial()));
                        },
                        color: Colors.white,
                        child: Text(
                          "Inglés",
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            fontFamily: 'Segoe UI Italic',
                            color: const Color(0xff017246),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
