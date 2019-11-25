import 'package:flutter/material.dart';
import 'package:proyect/screens/menu-screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('es','ES'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MenuScreen());
  }
}
