import 'package:ibase_app/common/api/api.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/entity/entity.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListController extends BaseGetController{

  final RefreshController refreshController = RefreshController();

  List<ArtistsEntity> list = [];

  int nextPage = 1;

  bool isMore = true;

  @override
  bool get enablePullUp => true;

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
    nextPage = 1;
    isMore = true;
    ApiService.getArtistsList(nextPage, 10).then((value) async{
      LogUtils.GGQ('------列表:------>>>${value.code}');
      if(ResponseUtils.isSuccess(value.code)) {
        final entity = ListEntity.fromJson(value.data);
        isMore = entity.more?? true;
        if(entity.artists != null && entity.artists!.isNotEmpty) {
          list.clear();
          list.addAll(entity.artists!);
          loadState = LoadState.success;
        }else {
          loadState = LoadState.empty;
        }
      } else {
        ToastUtils.showBar(ResponseUtils.getMessage(value.msg));
        loadState = LoadState.error;
      }
    }).onError((error, stackTrace){
      loadState = LoadState.error;
    }).whenComplete(() {
      super.initPullLoading();
    });
  }

  @override
  void onRefresh() {
    nextPage = 1;
    isMore = true;
    ApiService.getArtistsList(nextPage, 10).then((value) async{
      if(ResponseUtils.isSuccess(value.code)) {
        final entity = ListEntity.fromJson(value.data);
        isMore = entity.more?? true;
        if(entity.artists != null && entity.artists!.isNotEmpty) {
          list.clear();
          list.addAll(entity.artists!);
        }else {
          ToastUtils.showBar(ResponseUtils.getMessage(value.msg));
        }
      } else {
        ToastUtils.showBar(ResponseUtils.getMessage(value.msg));
      }
      super.onRefresh();
    }).whenComplete(() {
      if(refreshController.isRefresh){
        refreshController.refreshCompleted(resetFooterState: true);
      }
    });
  }

  @override
  void onLoadMore() {
    if(isMore) {
      nextPage ++;
      ApiService.getArtistsList(nextPage, 10).then((value) async{
        if(ResponseUtils.isSuccess(value.code)) {
          final entity = ListEntity.fromJson(value.data);
          if(entity.artists != null && entity.artists!.isNotEmpty) {
            list.addAll(entity.artists!);
            if(refreshController.isLoading) {
              refreshController.loadComplete();
            }
          }else {
            ToastUtils.showBar(ResponseUtils.getMessage(value.msg));
            if(refreshController.isLoading) {
              refreshController.loadNoData();
            }
          }
        } else {
          ToastUtils.showBar(ResponseUtils.getMessage(value.msg));
          if(refreshController.isLoading) {
            refreshController.loadFailed();
          }
        }
        super.onLoadMore();
      }).onError((error, stackTrace){
        if(refreshController.isLoading) {
          refreshController.loadFailed();
        }
      });
    } else {
      DelayedUtils.delayed(() {
        if(refreshController.isLoading) {
          refreshController.loadNoData();
        }
      });
    }
  }

  @override
  void onRetry() {
    loadState = LoadState.loading;
    updateRefresh();
    initPullLoading();
  }


}