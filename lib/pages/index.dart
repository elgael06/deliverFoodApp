import 'dart:async';

import 'package:deliverFood/controllers/Controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/pages/cartStore.dart';
import 'package:deliverFood/widgets/ScrollAppBarImg.dart';
import 'package:deliverFood/widgets/categoria_vista.dart';
import 'package:deliverFood/widgets/producto_vista_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexApp extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final StoreController store = Get.put(StoreController());

  IndexApp() {
    Timer(Duration(seconds: 2), () {
      reload();
      store.fethCategorias();
    });
  }

  Future<void> reload() async {
    store.getProductos();
    store.getProductosOferta();
  }

  _imaageHeader() {
    return Image.asset(
      'assets/img/portada.jpg',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => scrollAppBarImg(
            "Deliver food",
            _imaageHeader(),
            RefreshIndicator(
              onRefresh: () => reload(),
              child: ListView(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                children: [
                  Container(
                    child: ListView(
                      children: _listaCategorias(store.categorias),
                      scrollDirection: Axis.horizontal,
                    ),
                    height: 150,
                  ),
                  _titleList('Productos'),
                  Container(
                    child: ListView(
                      children: _listaProductos(store.productosStore),
                      scrollDirection: Axis.horizontal,
                    ),
                    height: 200,
                  ),
                  _titleList('Oferta'),
                  Container(
                    child: ListView(
                      children: _listaProductos(store.productosStoreOferta),
                      scrollDirection: Axis.horizontal,
                    ),
                    height: 200,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(cartStore(), transition: Transition.downToUp),
        child: Icon(Icons.shopping_basket),
        backgroundColor: Colors.brown,
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
                Icons.home,
              ),
              title: Text('inicio')),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.perm_device_information),
              title: Text('info')),
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

  List<Widget> _listaCategorias(List lista) {
    return lista.length > 0
        ? lista
            .map((e) => categoriaVista(
                e['image'].toString(),
                e['nombre'].toString(),
                e['nombre'].toString(),
                () => selecCategoria(e['pk'])))
            .toList()
        : [
            Center(
              widthFactor: 1,
              child: Text('Cargando...'),
            )
          ];
  }

  Widget _titleList(String title) => Container(
      margin: EdgeInsets.only(left: 10, top: 5),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: Colors.green,
            shadows: [
              Shadow(
                  color: Colors.green[100], blurRadius: 4, offset: Offset(1, 3))
            ]),
      ));

  selecCategoria(id) {
    print('categoria $id');
  }
}
