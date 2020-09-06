import 'package:deliverFood/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: IndexApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        accentColor: Colors.cyan[600],
        backgroundColor: Colors.cyan[700],
        appBarTheme: AppBarTheme(color: Colors.cyan[900])),
  ));
}
