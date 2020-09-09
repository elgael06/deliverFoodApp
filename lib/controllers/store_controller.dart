import 'dart:async';
import 'dart:convert';

import 'package:deliverFood/apis/fetchCategorias.dart';
import 'package:deliverFood/apis/fetchstore.dart';
import 'package:deliverFood/models/producto_store.dart';
import 'package:deliverFood/models/producto_pedido.dart';
import 'package:deliverFood/pages/categoria_producto.dart';
import 'package:deliverFood/pages/details.dart';
import 'package:get/get.dart';

///este es el controlador del store
class StoreController extends GetxController {
  var idCategoria = 0.obs;
  var imgCategoria = ''.obs;
  var nomCategoria = ''.obs;
  List<ProductoStore> productosStore = new List<ProductoStore>().obs;
  List<ProductoStore> productosStoreOferta = new List<ProductoStore>().obs;
  List<ProductoStore> productosCategoria = new List<ProductoStore>().obs;
  final producto = ProductoStore().obs;
  List<ProductoPedido> productosPedido = new List<ProductoPedido>().obs;
  var categorias = [].obs;
  var categoriaSelect = {}.obs;

  get totalPedido => productosPedido.length;
  fethCategorias() {
    categorias = getCategorias().obs;
    Get.forceAppUpdate();
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
        dato.tag = '${item['pk']}-prod';

        lista.add(dato);
      }
      productosStore = lista.obs;
      print(productosStore.length);
      Get.forceAppUpdate();
    } catch (err) {
      print('object${err.toString()}');
    }
  }

  Future getProductosOferta() async {
    List<ProductoStore> lista = [];
    productosStoreOferta = [];
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
        dato.tag = '${item['pk']}-oferta';

        lista.add(dato);
      }
      productosStoreOferta = lista.obs;
      print(productosStoreOferta.length);
      Get.forceAppUpdate();
    } catch (err) {
      print('object${err.toString()}');
    }
  }

  void productoApedido(ProductoStore prod) {
    ProductoPedido existeLista = ProductoPedido();

    existeLista.pk = prod.pk;
    existeLista.nombre = prod.nombre;
    existeLista.preparacion = prod.preparacion;
    existeLista.price = prod.price;
    existeLista.cantidad = prod.cantidad;
    existeLista.costo = prod.costo;
    existeLista.image = prod.image;
    existeLista.nProductos = 1;
    existeLista.total = prod.costo;

    productosPedido.add(existeLista);
    Get.forceAppUpdate();
    Get.back();
  }

  Future<void> resectProduct(int id, String tag) async {
    print('$id, $tag');

    var p = productosStore.firstWhere((element) => element.pk == id);

    print(p.nombre);
    producto.update((value) {
      value.pk = id;
      value.nombre = p.nombre;
      value.cantidad = p.cantidad;
      value.costo = p.costo;
      value.image = p.image;
      value.preparacion = p.preparacion;
      value.ingredientes = p.ingredientes;
      value.price = p.price;
      value.tag = tag;
    });
    Get.to(
      DetailsPage(),
    );
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
      value.ingredientes = res['ingredientes'];
      value.price = res['price'];
      value.tag = tag;
    });
    print(res);
    print(producto.value.nombre);
    Get.forceAppUpdate();
  }

  Future<void> obtenerPorCategiria(int id) async {
    print('id categiria $id');

    var cat = categorias.firstWhere((item) => item['pk'] == id);
    print(cat);
    idCategoria = id.obs;
    imgCategoria = cat['image'].toString().obs;
    nomCategoria = cat['nombre'].toString().obs;
    List<ProductoStore> lista = [];
    productosCategoria = [];
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
        dato.tag = '${item['pk']}-cat';

        lista.add(dato);
      }
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
        dato.tag = '${item['pk']}-cat_';

        lista.add(dato);
      }

      productosCategoria = lista.obs;
      Get.to(categoriaProductos());
      print(productosCategoria.length);
      Get.forceAppUpdate();
    } catch (err) {
      print('object${err.toString()}');
    }
  }
}
