import 'package:get/get.dart';

import 'setting.dart';


class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}