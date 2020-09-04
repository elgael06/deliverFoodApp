import 'dart:async';
import 'dart:convert';

import 'package:deliverFood/apis/fetchstore.dart';
import 'package:deliverFood/models/producto_store.dart';
import 'package:get/get.dart';

///este es el controlador del store
class StoreController extends GetxController {
  List<ProductoStore> productosStore = new List<ProductoStore>().obs;
  final producto = ProductoStore().obs;

  StoreController() {
    print('initial store controller');
    Timer(Duration(milliseconds: 500), getProductos);
  }

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

  void selectProduct(int id) {
    print(id);
    var sel = productosStore.firstWhere((element) => element.pk == id);
    print(sel.nombre);
    producto.update((value) {
      value.pk = sel.pk;
      value.nombre = sel.nombre;
      value.cantidad = sel.cantidad;
      value.costo = sel.costo;
      value.image = sel.image;
      value.preparacion = sel.preparacion;
      value.price = sel.price;
    });
    print(producto.value.nombre);
    Get.forceAppUpdate();
  }
}
