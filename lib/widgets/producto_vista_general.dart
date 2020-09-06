import 'package:deliverFood/widgets/imagen_fondo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget productoVistaGenerar(String src, String nombre, String costo,
    String preparacion, String tag, Function event) {
  return Hero(
      tag: tag,
      child: Card(
          margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          elevation: 5.0,
          child: Container(
              height: 230,
              child: Stack(alignment: Alignment.topCenter, children: [
                imagenFondo(src),
                others(nombre, costo, preparacion, tag, event)
              ]))));
}

Widget others(String nombre, String costo, String preparacion, String tag,
    Function event) {
  return Container(
    height: 210,
    padding: EdgeInsets.only(top: 110, left: 10, right: 10, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            textoProd('nombre: ', nombre),
            textoProd('costo: ', costo),
          ],
        ),
        RaisedButton(
          elevation: 2,
          onPressed: event,
          child: Text('Detalle'),
          color: Colors.cyan,
        ),
      ],
    ),
  );
}

Widget textoProd(des, valor) {
  return Row(textDirection: TextDirection.ltr, children: [
    Text(
      des,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    Text(valor)
  ]);
}
