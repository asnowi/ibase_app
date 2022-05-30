import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'splash.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Image.asset(AssetsProvider.imagePath('splash'),fit: BoxFit.fill)
      ),
    );
  }
}