import 'package:ibase_app/common/base/base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstController extends BaseGetController{

  final RefreshController refreshController = RefreshController();

  //  允许下拉
  final bool enablePullDown = true;
  //  允许上拉加载
  final bool enablePullUp = true;

  List<String> list = [];



  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady() {
    for (int i = 0; i < 10; i++) {
      list.add(i.toString());
    }
    update(['refresh']);
    super.onReady();
  }



  // void onRefresh() {
  //   DelayedUtils.delayed(() {
  //     if(refreshController.isRefresh){
  //       refreshController.refreshToIdle();
  //     }
  //   });
  // }
}