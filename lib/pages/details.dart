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
    print('tag ${store.producto.value.tag}');
    return Scaffold(
      appBar: AppBar(
        title: Text('detalles'),
      ),
      body: Hero(
        tag: store.producto.value.tag,
        child: Obx(
          () => ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/img/loading2.gif'),
                        image: NetworkImage(
                          store.producto.value.image,
                        ),
                        fit: BoxFit.fill,
                        fadeInDuration: Duration(milliseconds: 800),
                      ),
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
            ],
          ),
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
