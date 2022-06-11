import 'dart:math';

import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstController extends BaseGetController{

  final RefreshController refreshController = RefreshController();

  List<String> list = [];

  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onReady() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
    super.onReady();
  }


  @override
  void initPullLoading() {
    DelayedUtils.delayed(milliseconds: 5000,() {
      for (int i = 0; i < 10; i++) {
        list.add(i.toString());
      }
      loadState = LoadState.success;
      super.initPullLoading();
    });
  }

  final Random random = Random();
  @override
  void onRefresh() {
      DelayedUtils.delayed(() {
        final next = random.nextInt(100);
        list.clear();
        for (int i = 0; i < 10; i++) {
          list.add((i + next).toString());
        }
        if(refreshController.isRefresh){
          refreshController.refreshCompleted(resetFooterState: true);
        }
        super.onRefresh();
      });
  }
}