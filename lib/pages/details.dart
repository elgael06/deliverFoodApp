import 'package:deliverFood/controllers/Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detalles'),
      ),
      body: Center(child: Obx(() => Text('${c.count}'))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.restart(),
        backgroundColor: Color(0Xffd32f2f),
        child: Icon(Icons.delete),
      ),
    );
  }
}
