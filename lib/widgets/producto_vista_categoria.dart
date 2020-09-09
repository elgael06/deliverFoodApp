import 'package:deliverFood/widgets/imagen_fondo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget productoVistacategoria(String src, String nombre, String costo,
    String preparacion, String tag, Function event) {
  return Container(
      height: 200,
      width: 180,
      child: Hero(
          tag: tag,
          child: GestureDetector(
              onTap: event,
              child: Card(
                  color: Colors.amber,
                  margin:
                      EdgeInsets.only(top: 2, bottom: 10, left: 3, right: 3),
                  elevation: 5.0,
                  child: Container(
                      child: Stack(alignment: Alignment.topCenter, children: [
                    imagenFondo(src, 100, 200),
                    others(nombre, costo, preparacion, tag, event)
                  ]))))));
}

Widget others(String nombre, String costo, String preparacion, String tag,
    Function event) {
  return Container(
    height: 210,
    padding: EdgeInsets.only(top: 90, left: 10, right: 10, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              nombre,
              style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      color: Colors.brown,
                      blurRadius: 6.0,
                      offset: Offset(-4.0, -4.0),
                    ),
                    Shadow(
                      color: Colors.brown,
                      blurRadius: 6.0,
                      offset: Offset(4.0, 4.0),
                    ),
                  ]),
            ),
            textoProd('costo: ', costo),
          ],
        ),
      ],
    ),
  );
}

Widget textoProd(des, valor) {
  return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(textDirection: TextDirection.ltr, children: [
        Text(
          des,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
        Text(
          valor,
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w600),
        )
      ]));
}
