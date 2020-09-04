import 'package:deliverFood/controllers/Controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/pages/details.dart';
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
        title: Obx(() => Text("Clicks: ${c.count}")),
      ),
      body: Obx(
        () => ListView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.getProductos(),
        child: Icon(Icons.add),
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
    store.selectProduct(id);
  }
}

Widget indexApp() {
  final Controller c = Get.put(Controller());

  return Scaffold(
    appBar: AppBar(
      title: Obx(() => Text("Clicks: ${c.count}")),
    ),
    body: Center(
        child: RaisedButton(
            onPressed: () => Get.to(DetailsPage()),
            child: Text('Ir a otra pagina'))),
    floatingActionButton: FloatingActionButton(
      onPressed: () => c.increment(),
      child: Icon(Icons.add),
    ),
  );
}
