import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget scrollAppBarImg(String title, Widget img, Widget body) {
  return NestedScrollView(
      headerSliverBuilder: (BuildContext cont, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: img,
            ),
          ),
        ];
      },
      body: body);
}
