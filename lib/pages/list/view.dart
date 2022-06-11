import 'package:flutter/material.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:ibase_app/pages/list/controller.dart';

import 'package:flutter/src/widgets/scroll_view.dart' as View;

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
      body: _buildContent(),
    );
  }

  Widget _buildContent(){
    return GetBuilder<ListController>(
      id: 'refresh',
      // builder: (_) => Refresh(
      //   enablePullDown: controller.enablePullDown,
      //   enablePullUp: false,
      //   controller: controller.refreshController,
      //   onRefresh: () =>controller.onRefresh(),
      //   onLoadMore: () =>controller.onLoadMore(),
      //   child: controller.loadState == LoadState.loading ? loadingPage() : View.ListView.builder(
      //     itemBuilder: (BuildContext context, int index) => _buildItem(context,index),
      //     itemExtent: 90.0,
      //     itemCount: controller.list.length,
      //   ),
      // ),
      builder: (_) => const Text(''),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return const Card(
        elevation: 2.0,
        margin: const EdgeInsets.only(top: 10.0,bottom: 2.0,left: 12.0,right: 12.0),
        shadowColor: Colors.blueGrey,
        color: Colors.white,
        child: Text('aa')
    );
  }

}