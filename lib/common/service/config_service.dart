import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/utils/utils.dart';

class ConfigService extends GetxService{

  static ConfigService get to => Get.find();

  bool isHomeOpen = false;

  Locale locale = const Locale('en', 'US');

  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];


  @override
  void onInit() {
    isHomeOpen = StorageUtil().getBool(SaveInfoKey.FIRST_OPEN)?? false;
    LogUtils.GGQ('isHomeOpen-->${isHomeOpen}');
    super.onInit();
  }
}