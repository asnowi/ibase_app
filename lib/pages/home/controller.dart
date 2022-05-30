import 'package:get/get.dart';
import 'package:ibase_app/pages/home/home.dart';

class HomeController extends GetxController {
  final state = HomeState();

  @override
  void onReady() async{
    // await ConfigStore.to.saveAlreadyOpen();
    super.onReady();
  }
}