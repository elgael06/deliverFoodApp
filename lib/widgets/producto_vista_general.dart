import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget productoVistaGenerar(String src, String nombre, String costo,
    String preparacion, Function event) {
  return Card(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      elevation: 5.0,
      child: Container(
        width: 250,
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Column(
          children: [
            Image.network(
              src,
              width: 250,
              height: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, .5),
              ),
              height: 70,
              child: Stack(alignment: Alignment.bottomLeft, children: [
                Row(children: [
                  Text(
                    'Nombre: ',
                    textDirection: TextDirection.ltr,
                  ),
                  Text(nombre, textDirection: TextDirection.rtl),
                ]),
                Stack(alignment: Alignment.topRight, children: [
                  Row(children: [
                    Text(
                      'costo: ',
                      textDirection: TextDirection.ltr,
                    ),
                    Text(costo, textDirection: TextDirection.rtl)
                  ]),
                ])
              ]),
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              textDirection: TextDirection.ltr,
              children: [
                RaisedButton(
                  elevation: 2,
                  onPressed: event,
                  child: Text('Detalle'),
                  color: Color(0XFFFFF),
                )
              ],
            )
          ],
        ),
      ));
}

Widget newCardProduct(String src, String nombre, String costo,
    String preparacion, Function event) {
  return // Figma Flutter Generator CardproductoWidget - GROUP
      Container(
          width: 300,
          height: 300,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Color.fromRGBO(255, 255, 255, .5),
                    ))),
            Positioned(
                top: 261,
                left: 13,
                child: Text(
                  'Precio: \$ $costo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(77, 200, 56, 1),
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 0.626312255859375,
                left: 0,
                child: Container(
                    width: 300,
                    height: 168.4759979248047,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(src), fit: BoxFit.fitWidth),
                    ))),
            Positioned(
                top: 177.25469970703125,
                left: 13.1488037109375,
                child: Container(
                    width: 300,
                    height: 72.02505493164062,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 300,
                              height: 72.02505493164062,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(196, 196, 196, 0.5),
                              ))),
                      Positioned(
                          top: 8.74530029296875,
                          left: 21.8511962890625,
                          child: Text(
                            'Nombre : $nombre.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                    ]))),
            Positioned(
                top: 218.58038330078125,
                left: 26.297576904296875,
                child: Text(
                  'Ingredientes :  $preparacion.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
            Positioned(
                top: 261,
                left: 246.3667755126953,
                child: Container(
                    width: 130.7958526611328,
                    height: 28.9791316986084,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                              width: 130.7958526611328,
                              height: 28.9791316986084,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                                color: Color.fromRGBO(238, 238, 238, 1),
                              ))),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Detalles',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                    ]))),
          ]));
}
