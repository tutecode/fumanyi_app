import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fumanyi_app/features/presentation/pages/game_page.dart';
import 'package:fumanyi_app/features/presentation/utils/text_styles.dart';

class AppTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff017246),
        elevation: 0,
        title: Text(
          'Tutorial',
          textScaleFactor: 1.2,
          style: appBar,
        ),
      ),
      body: AppTutorialBody(),
    );
  }
}

class AppTutorialBody extends StatefulWidget {
  AppTutorialBody({Key key}) : super(key: key);

  @override
  AppTutorialBodyState createState() => AppTutorialBodyState();
}

class AppTutorialBodyState extends State<AppTutorialBody> {
  PageController _pageController; //PageController class
  CrossFadeState _bottomState = CrossFadeState.showFirst; //CrossFadeState enum

  //State<T extends StatefulWidget> > initState method
  //@override
  void initState() {
    super.initState();
    _pageController = PageController();
    //ChangeNotifier > addListener method
    _pageController.addListener(_pageListener);
  }

  //SingleTickerProviderStateMixin<T extends StatefulWidget> -> dispose method
  @override
  void dispose() {
    super.dispose();
    //ChangeNotifier > removeListener method
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
  }

  void _pageListener() {
    //ScrollController > hasClients property
    if (_pageController.hasClients) {
      //PageController > page property
      //PageController > initialPage property
      //Si _pageController.page no es nulo, devuelve su valor; de lo contrario,
      // evalúa y devuelve el valor de _pageController.initialPage.
      double page = _pageController.page ?? _pageController.initialPage;
      setState(() {
        if (page >= 1.5) {
          _bottomState = CrossFadeState.showSecond; //CrossFadeState enum
        } else {
          _bottomState = CrossFadeState.showFirst;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Stack class
    return Stack(
      fit: StackFit.expand, //Stack > fit property
      children: <Widget>[
        //TODO: CrossFade Screens
        PageView.builder(
          //PageView > PageView.builder constructor
          controller: _pageController,
          itemCount: pages.length,
          //IndexedWidgetBuilder typedef
          itemBuilder: (BuildContext context, int index) {
            //Column class
            return Column(
              //Flex > crossAxisAlignment property
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40.0),
                //Todo: Step Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 60.0, right: 60.0, bottom: 10.0),
                  child: Text(
                    pages[index].step,
                    textAlign: TextAlign.center,
                    textScaleFactor: 2.0,
                    style: firstText,
                  ),
                ),
                //TODO: Central Image
                Center(
                  child: Container(
                      width: 173.0,
                      height: 173.0,
                      child: Image.asset(pages[index].assetImagePath)),
                ),
                //TODO: First Central Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 60.0, right: 60.0, bottom: 10.0),
                  child: Text(
                    pages[index].text,
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.0,
                    style: firstText,
                  ),
                ),
                //TODO: Second Central Text under First Text
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 40.0, right: 40.0, bottom: 100.0),
                  child: Text(
                    pages[index].text_2,
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Segoe UI Regular',
                    ),
                  ),
                )
              ],
            );
          },
        ),
        //TODO: Dots Carousel
        Align(
          //alignment: Alignment.center,
          child: Container(
            height: 400.0,
            child: PageIndicators(
              pageController: _pageController,
            ),
          ),
        ),
        //TODO: Bottom Button '¡Arrancatelo ya amigo!'
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: const Color(0xff017246),
                  padding: EdgeInsets.symmetric(
                    vertical: 19.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePage()));
                  },
                  child: Text(
                    "¡Arrancatelo ya amigo!",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Segoe UI Italic',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: PageIndicators (Contents: Skip and Dots)
class PageIndicators extends StatelessWidget {
  final PageController pageController;

  const PageIndicators({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //TODO: Dots Carousel
        Align(
          alignment: Alignment.bottomCenter,
          child: PageViewIndicator(
            controller: pageController,
            pageCount: 6,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

//TODO: Page Model (Second Part)
class PageModel {
  final String assetImagePath;
  final String text;
  final String text_2;
  final String step;

  PageModel({this.assetImagePath, this.text, this.text_2, this.step});
}

List<PageModel> pages = [
  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-03.png',
    text: 'Armar los cigarros según la cantidad de jugadores:',
    text_2: '2 a 4 jugadores: 1 cigarro.\n5 a 8 jugadores: 2 cigarros.\n9 a 12 jugadores: 3 cigarros y un abogado.',
    step: 'Paso n° 1',
  ),
  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-04.png',
    text: 'Hacer vuelta de precalentamiento',
    text_2: "Todos fuman y pasan el cigarro rápido.",
    step: 'Paso n° 2',
  ),
  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-05.png',
    text: 'Por turnos, cada jugador pasa a la siguiente carta y recibe el cigarro.',
    text_2: 'Preparate loqui.',
    step: 'Paso n° 3',
  ),

  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-06.png',
    text: 'Según la consigna, fuma o no fuma, y luego pasar el cigarro al próximo',
    text_2: 'Las pitadas deben tener una duración máxima\nde DOS segundos. Esto es importantísimo.',
    step: 'Paso n° 4',
  ),

  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-08.png',
    text: 'La partida termina cuando el último cigarro es consumido',
    text_2: 'El jugador que fume la última pitada será\ndeclarado ganador.',
    step: 'Paso n° 5',
  ),

  PageModel(
    assetImagePath: 'assets/walkthrough_images/icons_weed-09.png',
    text: 'Empieza jugando el que trajo el contenido del cigarro',
    text_2: '¡Arrancate ese fantasíaaa animaaalll!',
    step: 'Paso n° 6',
  ),


];

//TODO: Page View Indicator (Third Part: Carousel Dots)
class PageViewIndicator extends StatefulWidget {
  PageViewIndicator({
    this.controller,
    this.pageCount,
    this.color: Colors.lightBlueAccent,
  });

  final PageController controller;

  final int pageCount;

  final Color color;

  static const double _indicatorSize = 4.0;

  static const double _indicatorZoom = 1.7;

  static const double _indicatorSpacing = 15.0;

  @override
  PageViewIndicatorState createState() => PageViewIndicatorState();
}

class PageViewIndicatorState extends State<PageViewIndicator> {
  double _page = 0.0;

  void initState() {
    super.initState();
    widget.controller.addListener(_pageListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    if (widget.controller.hasClients) {
      setState(() {
        _page = widget.controller.page ?? widget.controller.initialPage;
      });
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.pageCount, _buildDot),
    );
  }

  Widget _buildDot(int index) {
    //animation > Curves class
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - (_page - index).abs()),
    );
    double zoom = 1.0 + (PageViewIndicator._indicatorZoom - 1.0) * selectedness;

    return Container(
      width: PageViewIndicator._indicatorSpacing,
      child: Material(
        color: widget.color,
        type: MaterialType.circle,
        child: SizedBox(
          width: PageViewIndicator._indicatorSize * zoom,
          height: PageViewIndicator._indicatorSize * zoom,
        ),
      ),
    );
  }
}
