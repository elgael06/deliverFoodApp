import 'package:deliverFood/controllers/Controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/pages/cartStore.dart';
import 'package:deliverFood/widgets/producto_vista_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexApp extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final StoreController store = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text("Productos Pedido: ${store.totalPedido}");
        }),
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: () => store.getProductos(),
            child: ListView(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text('Lista de productos')),
                Container(
                  child: ListView(
                    children: _listaProductos(),
                    scrollDirection: Axis.horizontal,
                  ),
                  height: 265,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Text('Oferta de productos')),
                Container(
                  child: ListView(
                    children: _listaProductos(),
                    scrollDirection: Axis.horizontal,
                  ),
                  height: 265,
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
  List<Widget> _listaProductos() {
    return store.productosStore
        .map((e) => productoVistaGenerar(e.image, e.nombre, e.costo.toString(),
            e.ingredientes, () => seleccionar(e.pk)))
        .toList();
  }

  void seleccionar(int id) {
    print('Id Producto => $id');
    store.resectProduct(id);
  }
}
