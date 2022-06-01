import 'package:get/get.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/pages/home/home.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  final state = HomeState();

  late PageController pageController;

  int currentIndex = 0;



  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex,viewportFraction: 1, keepPage: true);
    super.onInit();
  }

  @override
  void onReady() async{
    bool result = await StorageUtil().setBool(SaveInfoKey.FIRST_OPEN, true);
    ConfigService.to.isHomeOpen = result;
    super.onReady();
  }


  // 修改索引
  void onChangePage(int index) {
    currentIndex = index;
    update(['navigator']);
  }

  // 切换视图
  void onJumpToPage(int index) {
    pageController.jumpToPage(index);
  }


  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}