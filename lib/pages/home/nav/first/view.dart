import 'dart:math';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstView extends BaseGetView<FirstController>{

  FirstView({Key? key}) : super(key: key);

  final RefreshController _refreshController = RefreshController(initialRefresh: false);


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
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: () =>onRefresh(),
        onLoadMore: () =>onLoadMore(),
        child: ListView.builder(
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

  void onRefresh() {
    DelayedUtils.delayed(() {
      if(_refreshController.isRefresh){
        _refreshController.refreshCompleted(resetFooterState: true);
      }
    });
  }
  final Random random = Random();

  void onLoadMore() {
    final num = random.nextInt(3); // 0,1,2
    DelayedUtils.delayed(() {
      if(_refreshController.isLoading){
        if(num == 1) {
          _refreshController.loadNoData();
        } else if(num == 2){
          _refreshController.loadFailed();
        } else {
          _refreshController.loadComplete();
        }
      }
    });
  }
}