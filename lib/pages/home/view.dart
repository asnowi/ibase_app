import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class HomeView extends GetView<HomeController> {

  HomeView({Key? key}) : super(key: key);

  DateTime? _popTime;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: const Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: Text('首页'),
      ),
      onWillPop: () async {
        if(_popTime == null || DateTime.now().difference(_popTime!) > const Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          _popTime = DateTime.now();
          // ToastUtils.showToast('再按一次退出');
          Get.snackbar('', '再按一次退出');
          return false;
        }
        return true;
      },
    );
  }

}