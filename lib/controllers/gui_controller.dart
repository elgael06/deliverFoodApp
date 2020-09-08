import 'package:get/get.dart';

class GuiController extends GetxController {
  var loadingPage = true.obs;
  var loadingCategorias = true.obs;
  var loadingProducts = true.obs;
  var loadingProductsOferta = true.obs;

  statusPage(bool status) {
    loadingPage = status.obs;
    Get.forceAppUpdate();
  }

  statusCategorias(bool status) {
    loadingCategorias = status.obs;
    Get.forceAppUpdate();
  }

  statusProducts(bool status) {
    loadingProducts = status.obs;
    Get.forceAppUpdate();
  }

  statusProductsOferta(bool status) {
    loadingProductsOferta = status.obs;
    Get.forceAppUpdate();
  }
}
