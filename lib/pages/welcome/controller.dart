import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';

class WelcomeController extends GetxController{

  @override
  void onReady() {
    super.onReady();
  }

  void toHome() {
    Get.offAndToNamed(AppRoutes.HOME);
  }
}