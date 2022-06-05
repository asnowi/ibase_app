import 'dart:async';

import 'package:get/get.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/db/db.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';

class MineController extends GetxController with WidgetsBindingObserver{

  User? user;

  bool isHiveUser(){
    return user != null;
  }

  void clearUser(){
    Global.user = null;
    user = null;
    update(['user']);
  }

  final LoadingButton loadingButton = LoadingButton(text: '登录',onPressed: (BuildContext context){
    Get.toNamed(AppRoutes.LOGIN);
  });


  void onLoadCancel() {
    loadingButton.onCancel();
  }

  StreamSubscription<CommonEvent>? _subscription;


  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    _subscription = EventBusUtils.listen((event) {
      LogUtils.GGQ('event:${event.code}');
      user = Global.user;
      if(event.code == EventCode.EVENT_LOGIN){
        update(['user']);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    if(Global.user != null) {
      user = Global.user;
      update(['user']);
    }
    super.onReady();
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

  @override
  void dispose() {
    if(_subscription != null){
      _subscription?.cancel();
    }
    super.dispose();
  }
}