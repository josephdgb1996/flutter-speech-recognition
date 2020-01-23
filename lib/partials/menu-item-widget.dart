import 'package:flutter/material.dart';

Widget menuItemWidget(String title, Color color){

   TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 30.0);

  return Container(
    height: 500,
    width: 300,
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: textStyle,)
      ],
    ) ,
  );
}