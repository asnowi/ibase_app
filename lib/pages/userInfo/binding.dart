import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/pages/userInfo/userInfo.dart';

class UserInfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserInfoController>(() => UserInfoController());
  }

}