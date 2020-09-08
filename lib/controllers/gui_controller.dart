import 'package:get/get.dart';

class GuiController extends GetxController {
  var loadingPage = true.obs;
  var loadingCategorias = true.obs;
  var loadingProducts = true.obs;
  var loadingProductsOferta = true.obs;

  statusPage(bool status) {
    print(loadingPage);
    loadingPage.update((value) {
      value = status;
    });
    print(loadingPage);
  }

  statusCategorias(bool status) {
    print(loadingCategorias);
    loadingCategorias.update((value) {
      value = status;
    });
    print(loadingCategorias);
  }

  statusProducts(bool status) {
    print(loadingProducts);
    loadingProducts.update((value) {
      value = status;
    });
    print(loadingProducts);
  }

  statusProductsOferta(bool status) {
    print(loadingProductsOferta);
    loadingProductsOferta.update((value) {
      value = status;
    });
    print(loadingProductsOferta);
  }
}
