import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,// 解决键盘顶起页面
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GetBuilder<LoginController>(
            id: 'close',
            builder: (_) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) {
                return ScaleTransition(scale: anim, child: child);
              },
              child: IconButton(
                key: UniqueKey(),
                onPressed: () {
                  controller.changeClose(!controller.isClose);
                  Get.back();
                },
                icon: Icon(
                  controller.isClose? Icons.close:Icons.close,
                  color: Colors.black,
                ),
              ),
            )),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  // webView help page
                },
                child: const Text('帮助?', style: TextStyle(color: Colors.black, fontSize: 14)))
          ],
        ),
        body: _buildContent(),
      );
  }


  Widget _buildContent(){
    return Text('content');
  }
}