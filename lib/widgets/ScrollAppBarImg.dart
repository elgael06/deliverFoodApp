import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget scrollAppBarImg(String title, Widget img, Widget body) {
  return NestedScrollView(
      headerSliverBuilder: (BuildContext cont, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              background: img,
            ),
          ),
        ];
      },
      body: body);
}
