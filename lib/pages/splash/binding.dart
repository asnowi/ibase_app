import 'package:get/get.dart';

import 'splash.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    // Get.lazyPut<SplashController>(() => SplashController());
    Get.put<SplashController>(SplashController());
  }
}