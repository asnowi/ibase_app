import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';

class LoginController extends GetxController{

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool isClose = false;

  void changeClose(bool isClose) {
    this.isClose = isClose;
    update(['close']);
  }



}