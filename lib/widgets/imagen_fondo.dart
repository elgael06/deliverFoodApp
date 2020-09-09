import 'package:flutter/widgets.dart';

Widget imagenFondo(String url, double h, double w) => Positioned(
        child: FadeInImage(
      placeholder: AssetImage('assets/img/loading2.gif'),
      image: NetworkImage(
        url,
      ),
      fadeInDuration: Duration(milliseconds: 800),
      height: h,
      width: w,
      fit: BoxFit.fitWidth,
    ));
