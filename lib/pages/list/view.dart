import 'package:flutter/material.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/pages/list/controller.dart';

class ListView extends BaseGetView<ListController>{

  ListView({Key? key}) : super(key: key);

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
        title: const Text('列表'),
        leading: IconButton(
          splashRadius: 22.0,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Center(child: Text('列表')),
    );
  }

}