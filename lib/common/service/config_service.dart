import 'package:get/get.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService{

  static ConfigService get to => Get.find();

  bool isHomeOpen = false;

  Locale locale = const Locale('en', 'US');

  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];


  // 是否黑暗模式
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 切换模式
  void switchThemeModel() {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppThemes.dark : AppThemes.light,
    );
  }



  @override
  void onInit() async{
    isHomeOpen = StorageUtil().getBool(SaveInfoKey.FIRST_OPEN)?? false;
    LogUtils.GGQ('isHomeOpen-->${isHomeOpen}');
    Global.user = Global.dbUtil?.getUser();
    LogUtils.GGQ('user-->${Global.user?.toString()}');
    super.onInit();
  }



   Future<String> getVersionName() async{
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
  }

  Future<String> getVersionCode() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  Future<String> getPackageName() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
}