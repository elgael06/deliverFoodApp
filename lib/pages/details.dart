import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/models/producto_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final StoreController store = Get.find();

  void addToList() {
    ProductoStore prod = store.producto.value;
    print('agregando ${prod.nombre}');
    store.productoApedido(prod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detalles'),
      ),
      body: Obx(
        () => ListView(
          children: [
            Center(
                child: Container(
              width: 350,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Image(
                          image: NetworkImage(store.producto.value.image)),
                    ),
                    Container(
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Text('Producto: ${store.producto.value.nombre}')
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text('Precio: ${store.producto.value.costo}')
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text(
                              'Ingredientes: ${store.producto.value.ingredientes}')
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text(
                              'Prparacion: ${store.producto.value.preparacion}')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_shopping_cart),
        label: Text('Agregar'),
        onPressed: () => addToList(),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
