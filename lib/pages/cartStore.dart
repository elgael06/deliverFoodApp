import 'package:deliverFood/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget cartStore() {
  StoreController store = Get.find();

  List<Widget> _procuctosCard() {
    var lista = store.productosPedido;
    return lista
        .map((e) => Card(
            elevation: 10,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 20, left: 10, right: 5),
              child: Column(
                children: [
                  Align(
                    child: Text('Producto ${e.nombre}'),
                    alignment: Alignment.centerLeft,
                  ),
                  Align(
                    child: Text(' \$${e.costo}'),
                    alignment: Alignment.centerRight,
                  )
                ],
              ),
            )))
        .toList();
  }

  double _totalProductos() {
    double total = 0;
    for (var item in store.productosPedido) {
      total += item.costo;
    }
    return total;
  }

  return Scaffold(
      appBar: AppBar(
        title: Text('Pedido'),
        actions: [
          Container(
              margin: EdgeInsets.only(top: 20, right: 10),
              child: Obx(() => Text('\$ ${_totalProductos()}')))
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            ..._procuctosCard(),
          ],
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
