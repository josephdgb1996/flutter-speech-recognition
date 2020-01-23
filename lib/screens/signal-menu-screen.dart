import 'package:flutter/material.dart';
import 'package:proyect/partials/signal-category-widget.dart';

class SignalMenuScreen extends StatelessWidget {
  const SignalMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categorias")),
      body: Stack(
        children: <Widget>[buildCategories()],
      ),
    );
  }

  Widget buildCategories() {
    return ListView(children: <Widget>[
      Table(children: [
        TableRow(children: [
          signalCategoryItemWidget("Saludos", Colors.blueAccent),
          signalCategoryItemWidget("Horario", Colors.purple)
        ]),
        TableRow(children: [
          signalCategoryItemWidget("Informatica", Colors.purple),
          signalCategoryItemWidget("Musica", Colors.lightBlue)
        ]),
        TableRow(children: [
          signalCategoryItemWidget("Lugares", Colors.orange),
          signalCategoryItemWidget("Tiempo", Colors.teal)
        ]),
        TableRow(children: [
          signalCategoryItemWidget("Colores", Colors.purple),
          signalCategoryItemWidget("Objetos", Colors.lightBlue)
        ])
      ])
    ]);
  }
}
