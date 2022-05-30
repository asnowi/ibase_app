import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigService extends GetxService{

  static ConfigService get to => Get.find();


  Locale locale = const Locale('en', 'US');

  List<Locale> languages = [
    const Locale('en', 'US'),
    const Locale('zh', 'CN'),
  ];


}