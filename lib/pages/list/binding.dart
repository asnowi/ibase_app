import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/pages/list/controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController());
  }

}