import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/router/router.dart';

class WelcomeController extends BaseGetController{

  @override
  void onReady() {
    super.onReady();
  }

  void toHome() {
    Get.offAndToNamed(AppRoutes.HOME);
  }
}