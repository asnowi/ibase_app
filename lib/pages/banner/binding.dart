import 'package:ibase_app/common/base/base.dart';

import 'banner.dart';

class BannerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BannerController>(() => BannerController());
  }

}