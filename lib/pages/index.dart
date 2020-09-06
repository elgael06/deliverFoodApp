import 'dart:async';

import 'package:deliverFood/controllers/Controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/pages/cartStore.dart';
import 'package:deliverFood/widgets/producto_vista_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexApp extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final StoreController store = Get.put(StoreController());

  IndexApp() {
    Timer(Duration(seconds: 2), () {
      reload();
    });
  }

  Future<void> reload() async {
    store.getProductos();
    store.getProductosOferta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text("Productos Pedido: ${store.totalPedido}");
        }),
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: () => reload(),
            child: ListView(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Lista de productos',
                      style: TextStyle(fontSize: 22),
                    )),
                Container(
                  child: ListView(
                    children: _listaProductos(store.productosStore),
                    scrollDirection: Axis.horizontal,
                  ),
                  height: 235,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Lista oferta.',
                      style: TextStyle(fontSize: 22),
                    )),
                Container(
                  child: ListView(
                    children: _listaProductos(store.productosStoreOferta),
                    scrollDirection: Axis.horizontal,
                  ),
                  height: 235,
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(cartStore(), transition: Transition.downToUp),
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        unselectedIconTheme: IconThemeData(color: Colors.white, opacity: .5),
        selectedIconTheme: IconThemeData(color: Colors.green[100], opacity: .5),
        selectedLabelStyle: TextStyle(color: Colors.green[300]),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              title: Text('productos')),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.monetization_on),
              title: Text('pagar')),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

// metodos
  List<Widget> _listaProductos(List lista) {
    return lista.length > 0
        ? lista
            .map((e) => productoVistaGenerar(
                e.image,
                e.nombre,
                e.costo.toString(),
                e.ingredientes,
                e.tag,
                () => store.resectProduct(e.pk, e.tag)))
            .toList()
        : [
            Center(
              widthFactor: 5,
              child: Text('Cargando...'),
            )
          ];
  }
}
