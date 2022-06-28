import 'dart:async';
import 'package:ibase_app/common/api/api.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/db/db.dart';
import 'package:ibase_app/common/entity/version_entity.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';

class MineController extends BaseGetController with WidgetsBindingObserver{

  User? user;

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

  String version = '';

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
    ConfigService.to.getVersionName().then((value) => {
      version = '当前版本 V${value}',
      update(['version'])
    });
    super.onReady();
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
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void checkVersion() async{
    String packageName = await ConfigService.to.getPackageName();
    String appType = "";
    if(Global.isAndroid) {
      appType = "0";
    } else if(Global.isIOS) {
      appType = "1";
    }

    if(!(GetUtils.isBlank(packageName)!) && !(GetUtils.isBlank(appType)!)) {
      ApiService.getAppVersion(packageName, appType).then((value) async{
        if(ResponseUtils.isSuccess(value.code)) {
          final entity = VersionEntity.fromJson(value.data['appInfo']);
          String versionCode = await ConfigService.to.getVersionCode();
          String? downloadPath = '';
          if(entity.versionCode != null && entity.downloadUrl != null && downloadPath != null) {
            if(entity.versionCode! > int.parse(versionCode)) {
              LogUtils.GGQ('新版本下载地址--->>${entity.downloadUrl}>');
            } else {
              ToastUtils.showBar('已经是最新版本！');
            }
          }
        } else {
          ToastUtils.showBar(ResponseUtils.getMessage(value.message));
        }
      });
    }
  }
}