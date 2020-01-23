import 'package:flutter/material.dart';

Widget signalCategoryItemWidget(String title, Color color){
  return Container(
    alignment: Alignment.center,
    height: 200,
    width: 200,
    color: color,
    child: Text(title, style: TextStyle(color: Colors.white,fontSize: 20.0))
  );
}