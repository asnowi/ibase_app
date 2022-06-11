import 'dart:math';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';

class FirstView extends BaseGetView<FirstController>{

  FirstView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: AppStyles.titleStyle,
        iconTheme: const IconThemeData(color: Colors.redAccent,size: 20.0),
        backgroundColor: Colors.white,
        title: const Text('首页'),
        actions: [
          IconButton(onPressed: (){
            ToastUtils.show('scan');
          },
          splashRadius: 22.0,
          icon: const Icon(Iconfont.scan))
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent(){
    return GetBuilder<FirstController>(
        id: 'refresh',
        builder: (_) => Refresh(
          enablePullDown: controller.enablePullDown,
          enablePullUp: false,
          controller: controller.refreshController,
          onRefresh: () =>controller.onRefresh(),
          onLoadMore: () =>controller.onLoadMore(),
          child: controller.loadState == LoadState.loading ? loadingPage() : ListView.builder(
            itemBuilder: (BuildContext context, int index) => _buildItem(context,index),
            itemExtent: 100.0,
            itemCount: controller.list.length,
          ),
        ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Card(child: Center(child: Text(controller.list[index],style: TextStyle(fontSize: 16.sp,color: Colors.black87))));
  }
}