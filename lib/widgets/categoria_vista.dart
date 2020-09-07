import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget categoriaVista(String src, String nombre, String tag, Function event) {
  return Hero(
      tag: tag,
      child: GestureDetector(
          onTap: event,
          child: Card(
              margin: EdgeInsets.only(top: 20, left: 1, right: 1, bottom: 10),
              elevation: 5.0,
              child: Container(
                  child: Stack(alignment: Alignment.topCenter, children: [
                Image.asset(
                  'assets/img/categorias/$src',
                  fit: BoxFit.contain,
                ),
                others(nombre, tag, event),
              ])))));
}

Widget others(String nombre, String tag, Function event) {
  return Container(
    padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [textoProd(nombre)],
    ),
  );
}

Widget textoProd(valor) {
  return Text(
    valor,
    style: TextStyle(
        color: Colors.brown,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: Colors.white,
            blurRadius: 6.0,
            offset: Offset(-4.0, -4.0),
          ),
          Shadow(
            color: Colors.white,
            blurRadius: 6.0,
            offset: Offset(4.0, 4.0),
          ),
          Shadow(
            color: Colors.white,
            blurRadius: 6.0,
            offset: Offset(1.0, 1.0),
          ),
          Shadow(
            color: Colors.white,
            blurRadius: 6.0,
            offset: Offset(10.0, 10.0),
          )
        ],
        decorationColor: Colors.purple),
  );
}
