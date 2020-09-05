import 'dart:async';
import 'dart:convert';

import 'package:deliverFood/apis/fetchstore.dart';
import 'package:deliverFood/models/producto_store.dart';
import 'package:deliverFood/models/producto_pedido.dart';
import 'package:deliverFood/pages/details.dart';
import 'package:get/get.dart';

///este es el controlador del store
class StoreController extends GetxController {
  List<ProductoStore> productosStore = new List<ProductoStore>().obs;
  final producto = ProductoStore().obs;
  List<ProductoPedido> productosPedido = new List<ProductoPedido>().obs;

  StoreController() {
    print('initial store controller');
    Timer(Duration(milliseconds: 500), getProductos);
  }
  get totalPedido => productosPedido.length;
  Future getProductos() async {
    List<ProductoStore> lista = [];
    productosStore = [];
    Get.forceAppUpdate();
    try {
      var res = await FetchStore().fetchProductos();
      var json = jsonDecode(res)['data'] as List;

      for (var item in json) {
        print(item);
        ProductoStore dato = ProductoStore();

        dato.pk = item['pk'];
        dato.price = item['price'];
        dato.costo = item['costo'];
        dato.cantidad = item['cantidad'];
        dato.nombre = item['nombre'];
        dato.image = item['image'];
        dato.ingredientes = item['ingredientes'];

        lista.add(dato);
      }
      productosStore = lista.obs;
      print(productosStore.length);
      Get.forceAppUpdate();
    } catch (err) {
      print('object${err.toString()}');
    }
  }

  set productoApedido(ProductoPedido prod) {
    var existeLista =
        productosPedido.firstWhere((element) => element.pk == prod.pk);
    if (existeLista.isNullOrBlank) {
      for (var item in productosPedido) {
        if (item.pk == existeLista.pk) {
          item.nProductos++;
          break;
        }
      }
    }
    prod.nProductos = 1;
    productosPedido.add(prod);
  }

  Future<void> resectProduct(int id) async {
    print(id);
    var data = await FetchStore().fetchProductoId(id);
    var res = jsonDecode(
        data); //productosStore.firstWhere((element) => element.pk == id);
    print(res['nombre']);
    producto.update((value) {
      value.pk = res['pk'];
      value.nombre = res['nombre'];
      value.cantidad = res['cantidad'];
      value.costo = res['costo'];
      value.image = res['image'];
      value.preparacion = res['preparacion'];
      value.price = res['price'];
    });
    print(res);
    print(producto.value.nombre);
    Get.forceAppUpdate();
    Get.to(DetailsPage(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 600));
  }
}
