import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BannerController extends BaseGetController with GetSingleTickerProviderStateMixin{


  final RefreshController refreshController = RefreshController();

  List<String> list = [];

  int nextPage = 1;

  bool isMore = true;

  @override
  bool get enablePullUp => true;

  @override
  void onReady() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
    super.onReady();
  }

  @override
  void initPullLoading() {
    for (int i = 0; i < 10; i++) {
      list.add(i.toString());
    }
    loadState = LoadState.success;
    super.initPullLoading();
  }


}