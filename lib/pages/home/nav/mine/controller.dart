import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';

class MineController extends GetxController with WidgetsBindingObserver{


  final LoadingButton loadingButton = LoadingButton(text: '登录',onPressed: (BuildContext context){
    Get.toNamed(AppRoutes.LOGIN);
  });


  void onLoadCancel() {
    loadingButton.onCancel();
  }


  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }


  @override
  void disposeId(Object id) {
    WidgetsBinding.instance.removeObserver(this);
    super.disposeId(id);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    LogUtils.GGQ('--GetxController 生命周期:--${state}');
    if (state == AppLifecycleState.resumed) {
      LogUtils.GGQ('app进入前台');
      onLoadCancel();
    } else if (state == AppLifecycleState.inactive) {
      LogUtils.GGQ('app在前台但不响应事件，比如电话，touch id等');
    } else if (state == AppLifecycleState.paused) {
      LogUtils.GGQ('app进入后台');
    } else if (state == AppLifecycleState.detached) {
      LogUtils.GGQ('没有宿主视图但是flutter引擎仍然有效');
    }
    super.didChangeAppLifecycleState(state);
  }
}