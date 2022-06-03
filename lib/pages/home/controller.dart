import 'package:get/get.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  late PageController pageController;

  int currentIndex = 0;



  @override
  void onInit() {
    pageController = PageController(initialPage: currentIndex,viewportFraction: 1, keepPage: true);
    pageController.addListener(() {
      LogUtils.GGQ('------pageController---->>>${pageController.position}');
    });
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
     pageController.animateToPage(index, duration: const Duration(milliseconds: 50), curve: Curves.linear);
  }


  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

}