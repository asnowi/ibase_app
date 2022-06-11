import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListController extends BaseGetController{

  final RefreshController refreshController = RefreshController();

  List<String> list = [];


  @override
  void onReady() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
    super.onReady();
  }

  @override
  void initPullLoading() {

    super.initPullLoading();
  }

}