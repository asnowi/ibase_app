import 'package:flutter/material.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'over_scroll_behavior.dart';

class Refresh extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final Widget content;
  final bool enablePullDown;
  final bool enablePullUp;

  Refresh(
      {required this.controller,
      required this.onRefresh,
      required this.onLoading,
      required this.content,
      this.enablePullDown = true,
      this.enablePullUp = true});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      child: RefreshConfiguration.copyAncestor(
        context: context,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: SmartRefresher(
            controller: controller,
            enablePullDown: enablePullDown,
            enablePullUp: enablePullUp,
            header: CustomHeader(
              builder: (BuildContext context, RefreshStatus? mode) {
                Widget body;
                if (mode == null) {
                  body = textIndicator('加载中...');
                }
                if (mode == RefreshStatus.canRefresh) {
                  body = textIndicator('松开刷新');
                } else if (mode == RefreshStatus.refreshing) {
                  body = textIndicator('加载中...');
                } else if (mode == RefreshStatus.idle) {
                  body = textIndicator('下拉刷新');
                } else if (mode == RefreshStatus.completed) {
                  body = textIndicator('加载成功');
                } else {
                  body = textIndicator('加载中...');
                }
                return Container(
                    padding: const EdgeInsets.only(top: 6.0, bottom: 10.0),
                    height: 76.0,
                    child: Center(child: body));
              },
            ),
            footer: CustomFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == null) {
                    body = textIndicator('加载中...');
                  }
                  if (mode == LoadStatus.idle) {
                    body = const Text('上拉加载', style: TextStyle(fontSize: 12));
                  } else if (mode == LoadStatus.loading) {
                    body = Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.grey),
                              strokeWidth: 1.6,
                            ),
                            width: 12,
                            height: 12,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('加载中...', style: TextStyle(fontSize: 12))
                        ],
                      ),
                    );
                  } else if (mode == LoadStatus.failed) {
                    body = const Text('加载失败！点击重试！',
                        style: TextStyle(fontSize: 12));
                  } else if (mode == LoadStatus.canLoading) {
                    body =
                        const Text('松手,加载更多!', style: TextStyle(fontSize: 12));
                  } else {
                    body =
                        const Text('没有更多数据了!', style: TextStyle(fontSize: 12));
                  }
                  return Container(
                    height: 55.0,
                    padding: const EdgeInsets.only(top: 6, bottom: 10),
                    child: Center(child: body),
                  );
                }),
            onRefresh: onRefresh,
            onLoading: onLoading,
            child: content,
          ),
        ),
        enableLoadingWhenFailed: true,
        maxUnderScrollExtent: 100.0,
        footerTriggerDistance: -45.0,
      ),
      enableLoadingWhenFailed: true,
      footerTriggerDistance: -60.0,
    );
  }

  Widget textIndicator(String statusStr) {
    return Container(
      child: Stack(
        children: [
          Lottie.asset(
            AssetsProvider.lottiePath('refresh'),
            // AssetsProvider.lottiePath('loadingYellow'),
            width: 96,
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: -2,
            left: 24,
            right: 0,
            child: Text(
              statusStr,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
