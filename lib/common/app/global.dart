import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/db/db_util.dart';
import 'package:ibase_app/common/utils/utils.dart';

///全局初始化
class Global{

  static late DBUtil dbUtil;

  static Future<void> init() async {
     // 运行初始
     WidgetsFlutterBinding.ensureInitialized();
      // 屏幕方向  竖屏
     await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

     setSystemUi();
     Loading();
     DBUtil.install();
     dbUtil = await DBUtil.getInstance();

  }


  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

}