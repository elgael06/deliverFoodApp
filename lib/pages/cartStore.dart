import 'package:deliverFood/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget cartStore() {
  StoreController store = StoreController();

  List<Widget> _procuctosCard() {
    var lista = store.productosPedido;
    return lista
        .map((e) => Card(
              child: Column(
                children: [Text('Producto $e.nombre')],
              ),
            ))
        .toList();
  }

  return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      body: Obx(
        () => ListView(
          children: _procuctosCard(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green[800],
        icon: Icon(Icons.send),
        label: Text(
          'Pedir',
          style: TextStyle(color: Colors.white),
        ),
        isExtended: true,
        splashColor: Colors.amber,
        onPressed: () => AlertDialog(),
      ));
}
