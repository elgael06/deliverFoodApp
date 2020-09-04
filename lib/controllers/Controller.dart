import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() {
    print('incrementar');
    count++;
  }

  restart() {
    count.update((val) {
      val = 0;
    });
    count = 0.obs;
    count.refresh();
  }
}
