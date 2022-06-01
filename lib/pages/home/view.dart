import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'home.dart';

class HomeView extends GetView<HomeController> {

  HomeView({Key? key}) : super(key: key);

  DateTime? _popTime;

  final PageController _pageController = PageController(initialPage: 0,viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height,
          child: _buildPageView()
        ),
      ),
      onWillPop: () async {
        if(_popTime == null || DateTime.now().difference(_popTime!) > const Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          _popTime = DateTime.now();
          // ToastUtils.showToast('再按一次退出');
          ToastUtils.showBar('再按一次退出！');
          return false;
        }
        return true;
      },
    );
  }

  Widget _buildPageView() {
    return PageView();
  }

}