import 'package:get/get.dart';

import 'mine.dart';

class MineBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<MineController>(MineController());

  }

}