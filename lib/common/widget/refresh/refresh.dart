import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/state/page_state.dart';
import 'package:ibase_app/common/widget/state/state.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'over_scroll_behavior.dart';


/// 刷新状态
enum RefreshState {
  /// 初次进入页面加载
  first,

  /// 上拉加载
  up,

  /// 下拉刷新
  down,
}

class Refresh extends StatelessWidget {
  const Refresh({
    Key? key,
    this.enablePullUp = false,
    this.enablePullDown = false,
    this.onRefresh,
    this.onLoadMore,
    this.onRetry,
    required this.loadState,
    required this.controller,
    required this.child
  }) : super(key: key);


  /// 是否启用上拉
  final bool enablePullUp;
  /// 是否启用下拉
  final bool enablePullDown;
  /// 下拉刷新回调
  final VoidCallback? onRefresh;
  /// 上拉加载回调
  final VoidCallback? onLoadMore;
  /// 错误页重试
  final VoidCallback? onRetry;

  /// 子类
  final LoadState loadState;
  final Widget child;
  final RefreshController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
        context: context,
        child: ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: SmartRefresher(
            controller: controller,
            enablePullDown: (loadState == LoadState.loading || loadState == LoadState.error)? false : enablePullDown,
            enablePullUp: (loadState == LoadState.loading || loadState == LoadState.error)? false : enablePullUp,
            header: CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {
              const TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.black87);
              Widget body = const Text('加载中...',style: textStyle);
              if(mode != null) {
                if (mode == RefreshStatus.canRefresh) {
                  body = const Text('松开刷新',style: textStyle);
                } else if (mode == RefreshStatus.refreshing) {
                  body = const Text('加载中...',style: textStyle);
                } else if (mode == RefreshStatus.idle) {
                  body = const Text('下拉刷新',style: textStyle);
                } else if (mode == RefreshStatus.completed) {
                  body = const Text('加载完成',style: textStyle);
                }
              }
              return Container(
                alignment: Alignment.center,
                height: 80.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset(
                      AssetsProvider.lottiePath('refresh'),
                      // AssetsProvider.lottiePath('loadingYellow'),
                      width: 96.0,
                      alignment: Alignment.center,
                    ),
                    Positioned(
                        bottom: -2,
                        child: body
                    ),
                  ],
                ),
              );
            }),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                const TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.black87);
                Widget body = const Text('加载中...',style: textStyle);
                if(mode != null) {
                  if (mode == LoadStatus.idle){
                    body = const Text('上拉加载',style: textStyle);
                  } else if(mode == LoadStatus.loading) {
                    body =  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width:16.0,height:16.0,child: CircularProgressIndicator(strokeWidth: 1.2,color: Colors.black87,)),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
                        Text('加载中...',style: textStyle)
                      ],
                    );
                  } else if(mode == LoadStatus.failed){
                    body = const Text('加载失败！请重试!',style: textStyle);
                  } else if(mode == LoadStatus.canLoading){
                    body = const Text('松手,加载更多!',style: textStyle);
                  } else {
                    body = const Text('没有更多数据了!',style: textStyle);
                  }
                }
                return Container(
                  height: 55.0,
                  alignment: Alignment.center,
                  child: Center(child:body),
                );
              },
            ),
            onRefresh: onRefresh,
            onLoading: onLoadMore,
            child: _buildChild(),
          )
        ),
    );
  }


  Widget _buildChild(){
    if(loadState == LoadState.loading) {
      return buildLoading();
    } else if(loadState == LoadState.empty){
      return buildEmpty();
    } else if(loadState == LoadState.error) {
      return buildError(onRetry);
    }
    return child;
  }


  Widget buildLoading(){
    return const LoadingPage();
  }

  Widget buildEmpty(){
    return const EmptyPage();
  }

  Widget buildError(VoidCallback? onRetry) {
    return ErrorPage(onRetry: onRetry);
  }
}

