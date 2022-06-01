import 'package:get/get.dart';

import 'first.dart';

class FirstBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<FirstController>(FirstController());
  }

}