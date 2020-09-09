import 'package:deliverFood/controllers/gui_controller.dart';
import 'package:deliverFood/controllers/store_controller.dart';
import 'package:deliverFood/widgets/producto_vista_categoria.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget categoriaProductos() {
  final StoreController store = Get.find();
  final GuiController gui = Get.put(GuiController());

  Future<void> _reload() async {
    int id = store.idCategoria.value;
    print('categoria $id');
    gui.statusPage(true);
    await store.obtenerPorCategiria(id);
    gui.statusPage(false);
  }

  List<Widget> _listaProductos(List lista) {
    return lista.length > 0
        ? lista
            .map((e) => productoVistacategoria(
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

  _topAppBar(body) => NestedScrollView(
      headerSliverBuilder: (BuildContext cont, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.brown,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            elevation: 20,
            title: Text(
              store.nomCategoria.value,
              style: TextStyle(color: Colors.white),
            ),
            shadowColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: FadeInImage(
                placeholder: AssetImage('assets/img/portada.jpg'),
                image: AssetImage(
                    'assets/img/categorias/${store.imgCategoria.value}'),
                fit: BoxFit.fill,
                fadeInDuration: Duration(milliseconds: 800),
              ),
            ),
          ),
        ];
      },
      body: body);
  return Scaffold(
      body: Obx(() => _topAppBar(RefreshIndicator(
          child: ListView(
            children: [
              Container(
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [..._listaProductos(store.productosCategoria)],
                ),
              )
            ],
          ),
          onRefresh: () => _reload()))));
}
