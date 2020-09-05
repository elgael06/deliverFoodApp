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
      body: ListView(
        children: [
          Center(
              child: Container(
            height: 350,
            width: 350,
            child: Card(
              child: Column(
                children: [Text('datos')],
              ),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.restart(),
        backgroundColor: Colors.green[600],
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
