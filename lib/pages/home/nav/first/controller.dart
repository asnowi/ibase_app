import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstController extends GetxController{

  final RefreshController refreshController = RefreshController();

  //  允许下拉
  final bool enablePullDown = true;
  //  允许上拉加载
  final bool enablePullUp = true;

  List<String> list = [];



  @override
  void onReady() {
    for (int i = 0; i < 10; i++) {
      list.add(i.toString());
    }
    if(list.isNotEmpty) {
      update(['list']);
    }
    super.onReady();
  }



  void onRefresh() {
    DelayedUtils.delayed(() {
      if(refreshController.isRefresh){
        refreshController.refreshToIdle();
      }
    });
  }

  void onLoading(){
    DelayedUtils.delayed(() {
      if(refreshController.isLoading){
        LogUtils.GGQ('---->onLoading');
        refreshController.loadComplete();
      }
    });
  }
}