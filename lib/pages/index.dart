import 'dart:async';

import 'package:deliverFood/controllers/Controller.dart';
import 'package:deliverFood/controllers/gui_controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/pages/cartStore.dart';
import 'package:deliverFood/widgets/ScrollAppBarImg.dart';
import 'package:deliverFood/widgets/categoria_vista.dart';
import 'package:deliverFood/widgets/producto_vista_general.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';

class IndexApp extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final StoreController store = Get.put(StoreController());
  final GuiController gui = Get.put(GuiController());

  IndexApp() {
    Timer(Duration(seconds: 2), () {
      reload();
    });
  }

  Future<void> reload() async {
    // gui.statusCategorias(true);
    gui.statusProducts(true);
    gui.statusProductsOferta(true);

    store.fethCategorias();
    gui.statusCategorias(false);

    await store.getProductos();
    gui.statusProducts(false);

    await store.getProductosOferta();
    gui.statusProductsOferta(false);
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
                  _containerLista(_listaCategorias(store.categorias), 150,
                      gui.loadingCategorias.value),
                  _titleList('Productos'),
                  _containerLista(_listaProductos(store.productosStore), 200,
                      gui.loadingProducts.value),
                  _titleList('Oferta'),
                  _containerLista(_listaProductos(store.productosStoreOferta),
                      200, gui.loadingProductsOferta.value),
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
  Widget _containerLista(List<Widget> lista, double h, bool status) =>
      Container(
        child: status
            ? Container(
                child: Center(
                  child: Loading(
                    indicator: BallGridPulseIndicator(),
                    size: 50,
                    color: Colors.purple,
                  ),
                ),
              )
            : ListView(
                children: lista,
                scrollDirection: Axis.horizontal,
              ),
        height: h,
      );
  List<Widget> _listaProductos(List lista) {
    return lista.length > 0
        ? lista
            .map((e) => productoVistaGenerar(
                e.image,
                e.nombre,
                e.costo.toStringAsFixed(2),
                e.ingredientes,
                e.tag,
                () => store.resectProduct(e.pk, e.tag)))
            .toList()
        : [
            Center(
              widthFactor: 5,
              child: Text('Sin datos'),
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

  Future selecCategoria(id) async {
    print('categoria $id');

    gui.statusPage(true);
    gui.statusCategorias(true);
    await store.obtenerPorCategiria(id);
    gui.statusCategorias(false);
    gui.statusPage(false);
  }
}
