import 'package:get/get.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/pages/home/home.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  final state = HomeState();

  @override
  void onReady() async{
    bool result = await StorageUtil().setBool(SaveInfoKey.FIRST_OPEN, true);
    ConfigService.to.isHomeOpen = result;
    super.onReady();
  }
}