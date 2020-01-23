import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proyect/screens/signal-menu-screen.dart';
import 'package:proyect/screens/spech-recognition-screen.dart';
import 'package:proyect/screens/test-menu-screen.dart.dart';
import 'package:proyect/partials/menu-item-widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: bodyWidget(context)));
  }

  Widget appBarWidget() {
    TextStyle titleTextStyle = TextStyle(fontSize: 38.0);
    TextStyle subtileTextStyle = TextStyle(fontSize: 20.0);

    return PreferredSize(
        preferredSize: Size.fromHeight(300.0),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text("Proyecto Utm", style: titleTextStyle),
              Text("discapacidad auditiva", style: subtileTextStyle)
            ],
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
        ));
  }

  Widget titleWidget() {
    TextStyle titleTextStyle = TextStyle(fontSize: 38.0);
    TextStyle subtileTextStyle = TextStyle(fontSize: 20.0);

    return Container(
        margin: EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Proyecto Utm", style: titleTextStyle),
            Text("discapacidad auditiva", style: subtileTextStyle)
          ],
        ));
  }

  Widget menuSliderWidget(BuildContext context) {
    List<Widget> items = [
      GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => SignalMenuScreen()));
        },
        child: menuItemWidget("Señas", Colors.green),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => TestMenuScreen()));
        },
        child: menuItemWidget("Pruebas", Colors.blueAccent),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => SpeechRecognitionScreen()));
        },
        child: menuItemWidget("Audio", Colors.orange),
      )
    ];

    return CarouselSlider(
      items: items,
      height: 400,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Stack(children: <Widget>[
      Align(alignment: Alignment.topCenter, child: titleWidget()),
      Align(alignment: Alignment.center, child: menuSliderWidget(context)),
    ]);
  }
}
