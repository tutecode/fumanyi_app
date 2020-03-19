import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fumanyi_app/features/presentation/utils/text_styles.dart';
import 'package:fumanyi_app/features/presentation/widgets/list_Card.dart';

class GamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GamePageState();
  }
}

class GamePageState extends State<GamePage> {
  ///New
  ListCard cardList = ListCard();
  int index = 0;

  @override
  void initState() {
    super.initState();
    getNewCard();
  }

  void getNewCard() {
    setState(() {
      cardList.nextCard();
    });
  }

  /*
  Random random = new Random();
  int _index = 0;

  void changeIndex() {
    ///Total Cards = ?? Siempre +1 que el JSON
    setState(() => _index = random.nextInt(35));
  }
  */

  Widget build(BuildContext context) {
    // TODO: implement build

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
          body: Stack(
            children: <Widget>[
              Positioned.directional(
                top: 65,
                start: 39,
                textDirection: TextDirection.ltr,
                child: Container(
                  width: 283,
                  height: 385,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                    border: Border.all(
                      color: const Color(0xffffffff),
                      width: 1,
                    ),
                    color: const Color(0xff017246),
                  ),

                  ///Card
                  child: PageView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return PageView(
                            children: <Widget>[
                              Container(
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 20,
                                          top: 20,
                                        ),
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            ///Title
                                            Text(
                                              cardList.getNextCard(),
                                              textScaleFactor: 1.4,
                                              textAlign: TextAlign.left,
                                              style: titleHome,
                                            ),

                                            ///Line
                                            Divider(
                                              color: Colors.white,
                                            ),

                                            ///Info
                                            Text(
                                              cardList.getNextCardInfo(),
                                              textScaleFactor: 1.0,
                                              textAlign: TextAlign.left,
                                              style: infoHome,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                      ),
                ),
              ),

              ///Button
              PositionedDirectional(
                top: 467,
                start: 40,
                child: InkWell(
                  onTap: () {
                    cardList.removeCard();
                    getNewCard();
                  },
                  child: new Container(
                    width: 283,
                    height: 56,
                    //padding: const EdgeInsets.all(23.0),
                    decoration: new BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      color: const Color(0xff017246),
                      border:
                      Border.all(color: const Color(0xffffffff), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Siguiente carta",
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: buttonHome,
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}