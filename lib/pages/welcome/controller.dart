import 'package:get/get.dart';
import 'package:ibase_app/pages/welcome/welcome.dart';

class WelcomeController extends GetxController{

  final state = WelcomeState();


  @override
  void onReady() {
    super.onReady();
  }

  void toHome() {
    // Get.toNamed(AppRoutes.HOME);
  }
}