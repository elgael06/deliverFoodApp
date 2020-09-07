import 'package:flutter/widgets.dart';

Widget imagenFondo(String url) => Positioned(
        child: FadeInImage(
      placeholder: AssetImage('assets/img/loading2.gif'),
      image: NetworkImage(
        url,
      ),
      fadeInDuration: Duration(milliseconds: 800),
      height: 100,
      width: 200,
      fit: BoxFit.fitWidth,
    ));
