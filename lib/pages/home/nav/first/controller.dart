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
      list.add(ItemEntity(id: 2, title: '轮播图', describe: 'Banner + ListView',time: TimeUtils.formatDate(format: TimeUtils.format)));
      loadState = LoadState.success;
      super.initPullLoading();
    });
  }

  final Random random = Random();

  @override
  void onRefresh() {
    final next = random.nextInt(3); // 0,1,2

    DelayedUtils.delayed(() {
        list.clear();
        list.add(ItemEntity(id: 1, title: '列表', describe: 'ListView + State Page + Refresh + Dio',time: TimeUtils.formatDate(format: TimeUtils.format)));
        list.add(ItemEntity(id: 2, title: '轮播图', describe: 'Banner + ListView',time: TimeUtils.formatDate(format: TimeUtils.format)));
        if(refreshController.isRefresh){
          refreshController.refreshCompleted(resetFooterState: true);
        }
        if(next == 1) {
          loadState = LoadState.empty;
        } else if(next == 2){
          loadState = LoadState.error;
        } else {
          loadState = LoadState.success;
        }
        super.onRefresh();
      });
  }

  @override
  void onRetry() {
    loadState = LoadState.loading;
    updateRefresh();

    final next = random.nextInt(3); // 0,1,2
    DelayedUtils.delayed(() {
      list.clear();
      list.add(ItemEntity(id: 1, title: '列表', describe: 'ListView + State Page + Refresh + Dio',time: TimeUtils.formatDate(format: TimeUtils.format)));
      list.add(ItemEntity(id: 2, title: '轮播图', describe: 'Banner + ListView',time: TimeUtils.formatDate(format: TimeUtils.format)));

      if(next == 1) {
        loadState = LoadState.empty;
      } else if(next == 2){
        loadState = LoadState.error;
      } else {
        loadState = LoadState.success;
      }
      super.onRetry();
    });
  }


  void onItemClick(int id){
    switch(id) {
      case 1: {
        Get.toNamed(AppRoutes.LIST);
      }
      break;

      case 2: {
        Get.toNamed(AppRoutes.BANNER);
      }
      break;

      default: {
        ToastUtils.show('未知:${id}');
      }
      break;
    }
  }
}