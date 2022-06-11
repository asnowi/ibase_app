import 'package:get/get.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';

class BaseGetController extends GetxController {

  bool get isHiveUser => Global.user != null;


  /// 加载状态
  var loadState = LoadState.loading;

  //  允许下拉
  bool enablePullDown = true;
  //  允许上拉加载
  bool enablePullUp = true;


  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  
  @override
  void dispose() {
    super.dispose();
  }


  void initPullLoading(){
    updateRefresh();
  }

  void onRetry(){
    updateRefresh();
  }

  void onRefresh() {
    updateRefresh();
  }

  void onLoadMore() {
    updateRefresh();
  }

  void updateRefresh(){
     update(['refresh']);
  }




// void onRefresh() {
//   DelayedUtils.delayed(() {
//     if(_refreshController.isRefresh){
//       _refreshController.refreshCompleted(resetFooterState: true);
//     }
//   });
// }
// final Random random = Random();
//
// void onLoadMore() {
//   final num = random.nextInt(3); // 0,1,2
//   DelayedUtils.delayed(() {
//     if(_refreshController.isLoading){
//       if(num == 1) {
//         _refreshController.loadNoData();
//       } else if(num == 2){
//         _refreshController.loadFailed();
//       } else {
//         _refreshController.loadComplete();
//       }
//     }
//   });
// }
}