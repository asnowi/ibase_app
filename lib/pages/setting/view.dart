import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';

import 'setting.dart';

class SettingView extends GetView<SettingController>{

  SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: AppStyles.titleStyle,
        iconTheme: const IconThemeData(color: Colors.black38,size: 20.0),
        backgroundColor: Colors.white,
        title: Text('设置'),
        leading: IconButton(
          splashRadius: 22.0,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back();
          },
        ),
        actions: [
          IconButton(
            splashRadius: 22.0,
            icon: const Icon(Icons.settings),
            onPressed: () => _onActionMenu()
          ),
        ],
      ),
      body: Center(child: Text('设置')),
    );
  }

  void _onActionMenu(){
    ToastUtils.show('menu');
  }
}