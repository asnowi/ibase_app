import 'package:get/get.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';

class BaseGetController extends GetxController {

  bool get isHiveUser => Global.user != null;

  /// 加载状态
  var loadState = LoadState.loading;
  /// 是否初次加载
  var isInit = true;

  /// 刷新控制器
  RefreshController _refreshController = RefreshController();


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

  void initPullLoading(RefreshController refreshController) {
      if(isInit) {
          this._refreshController = refreshController;
          this.loadState = LoadState.loading;
          update(['refresh']);
      }
  }

  void onRefresh(RefreshController refreshController) {
    this._refreshController = refreshController;

  }

  void onLoadMore(RefreshController refreshController) {
    this._refreshController = refreshController;

  }

}