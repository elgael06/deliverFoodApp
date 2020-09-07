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
      body: Hero(
          tag: store.producto.value.tag,
          child: Obx(() => _topAppBar(store.producto.value.image))),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_shopping_cart),
        label: Text('Agregar'),
        onPressed: () => store.producto.value.costo != 0 ? addToList() : null,
        backgroundColor: Colors.purple,
      ),
    );
  }

  _bodyDetalle() => Center(
        child: Column(
          children: [
            _informacio(
                'Precio: ${store.producto.value.costo.toStringAsFixed(2)}'),
            _informacio('Ingredientes: ${store.producto.value.ingredientes}'),
            _informacio('Prparacion: ${store.producto.value.preparacion}')
          ],
        ),
      );

  _topAppBar(img) => NestedScrollView(
      headerSliverBuilder: (BuildContext cont, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.amber,
            expandedHeight: 400,
            floating: true,
            pinned: true,
            elevation: 20,
            title: Text(
              store.producto.value.nombre,
              style: TextStyle(color: Colors.white),
            ),
            shadowColor: Colors.blue,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: FadeInImage(
                placeholder: AssetImage('assets/img/portada.jpg'),
                image: NetworkImage(
                  img,
                ),
                fit: BoxFit.fill,
                fadeInDuration: Duration(milliseconds: 800),
              ),
            ),
          ),
        ];
      },
      body: _bodyDetalle());

  _informacio(String text) => Container(
        height: 40,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [Text(text)],
        ),
      );
}
