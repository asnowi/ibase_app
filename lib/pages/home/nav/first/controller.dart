import 'dart:math';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/entity/item_entity.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstController extends BaseGetController{

  final RefreshController refreshController = RefreshController();

  List<ItemEntity> list = [];

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
    DelayedUtils.delayed(() {
      list.add(ItemEntity(id: 1, title: '列表', describe: 'ListView + State Page + Refresh + Dio',time: TimeUtils.formatDate(format: TimeUtils.format)));
      loadState = LoadState.success;
      super.initPullLoading();
    });
  }

  final Random random = Random();
  @override
  void onRefresh() {
      DelayedUtils.delayed(() {
        list.clear();
        list.add(ItemEntity(id: 1, title: '列表', describe: 'ListView + State Page + Refresh + Dio',time: TimeUtils.formatDate(format: TimeUtils.format)));
        if(refreshController.isRefresh){
          refreshController.refreshCompleted(resetFooterState: true);
        }
        loadState = LoadState.error;
        super.onRefresh();
      });
  }

  @override
  void onRetry() {
    loadState = LoadState.loading;
    updateRefresh();
    DelayedUtils.delayed(() {
      list.clear();
      list.add(ItemEntity(id: 1, title: '列表', describe: 'ListView + State Page + Refresh + Dio',time: TimeUtils.formatDate(format: TimeUtils.format)));
      loadState = LoadState.success;
      super.onRetry();
    });
  }


  void onItemClick(int id){
    switch(id) {
      case 1: {
        Get.toNamed(AppRoutes.LIST);
      }
      break;

      default: {
        ToastUtils.show('未知:${id}');
      }
      break;
    }
  }
}