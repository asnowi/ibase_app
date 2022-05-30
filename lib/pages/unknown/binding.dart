import 'package:get/get.dart';

import 'unknown.dart';

class UnknownBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut<UnknownController>(() => UnknownController());
    Get.put<UnknownController>(UnknownController());

  }

}