import 'package:get/get.dart';
import 'package:ibase_app/common/base/base.dart';

import 'first.dart';

class FirstBinding extends Bindings{

  @override
  void dependencies() {
    Get.put<FirstController>(FirstController());
  }

}