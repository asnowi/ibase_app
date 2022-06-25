import 'package:flutter/material.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/pages/list/controller.dart';

import 'package:flutter/src/widgets/scroll_view.dart' as View;

class ListView extends BaseGetView<ListController>{

  ListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        elevation: 2.0,
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
      body: _buildContent(),
    );
  }

  Widget _buildContent(){
    return GetBuilder<ListController>(
      id: 'refresh',
      builder: (_) => Refresh(
        enablePullDown: controller.enablePullDown,
        enablePullUp: controller.enablePullUp,
        controller: controller.refreshController,
        onRefresh: () =>controller.onRefresh(),
        onLoadMore: () =>controller.onLoadMore(),
        loadState: controller.loadState,
        child: View.ListView.builder(
          itemBuilder: (BuildContext context, int index) => _buildItem(context,index),
          itemExtent: 120.0,
          itemCount: controller.list.length,
        ),
        onRetry: ()=> controller.onRetry(),
      ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.only(top: 10.0,bottom: 2.0,left: 12.0,right: 12.0),
        shadowColor: Colors.blueGrey,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: ConstrainedBox(
                  constraints: BoxConstraints.loose(const Size(52,52)),
                  child: ImageLoader.load(url: '')),
                ) ,
              const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.list[index].username??'',style: TextStyle(fontSize: 14.sp,color: Colors.black87,fontWeight: FontWeight.bold)),
                  Text('手机号:${controller.list[index].phone}',style: TextStyle(fontSize: 12.sp,color: Colors.black87)),
                  Text('IP:${controller.list[index].ip}',style: TextStyle(fontSize: 12.sp,color: Colors.black87)),
                  Text('创建时间:${controller.list[index].createTime}',style: TextStyle(fontSize: 12.sp,color: Colors.black87)),
                ],
              )
            ],
          ),
        )
    );
  }

}