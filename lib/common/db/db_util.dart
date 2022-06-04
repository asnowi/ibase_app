import 'package:hive/hive.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/utils/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'db.dart';

class DBUtil{
  /// 实例
  static DBUtil? instance;

  /// 用户信息
  late Box userBox;

  /// 初始化，需要在 main.dart 调用
  /// <https://docs.hivedb.dev/>
  static Future<void> install() async {
    /// 初始化数据库地址
    Directory document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    /// 注册自定义对象（实体）
    /// <https://docs.hivedb.dev/#/custom-objects/type_adapters>
    /// Hive.registerAdapter(SettingsAdapter());
    Hive.registerAdapter(UserAdapter());
  }

  /// 初始化 Box
  static Future<DBUtil?> getInstance() async {
    if (instance == null) {
      instance = DBUtil();
      // await Hive.initFlutter();
      instance?.userBox = await Hive.openBox('user');
    }
    return instance;
  }

  //---------用户信息----------------
  Future<int?> saveUser(User user) async{
    LogUtils.GGQ('------saveUser------>>>${user.toString()}');
    return Global.dbUtil?.userBox.add(user);
  }

  User? getUser(){
    final users = Global.dbUtil?.userBox.values;
    if(users != null && users.isNotEmpty){
      return users.last;
    }
    return null;
  }
}