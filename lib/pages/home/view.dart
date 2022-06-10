import 'package:flutter/services.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/tab/custom_circular_rect_angle.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';
import 'package:ibase_app/pages/home/nav/mine/mine.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class HomeView extends BaseGetView<HomeController> {

  HomeView({Key? key}) : super(key: key);

  DateTime? _popTime;

  final List<Widget> _pageList = [
    FirstView(),
    MineView(),
  ];

  final List<String> tabLottie = [
    AssetsProvider.lottiePath('tab_first'),
    AssetsProvider.lottiePath('tab_mine'),
  ];

  final List<String> tabIcon = [
    AssetsProvider.imagePath('tab_first'),
    AssetsProvider.imagePath('tab_mine'),
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      onWillPop: () async {
        if(_popTime == null || DateTime.now().difference(_popTime!) > const Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          _popTime = DateTime.now();
          // ToastUtils.showToast('再按一次退出');
          ToastUtils.showBar('再按一次退出！');
          return false;
        }
        // 退出app
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },
    );
  }

  Widget _buildPageView() {
    return GetBuilder<HomeController>(
        id: 'navigator',
        builder: (_) => PageView(
            physics: const NeverScrollableScrollPhysics(),
            //横向滑动切换
            scrollDirection: Axis.horizontal,
            controller: controller.pageController,
            children: _pageList,
            onPageChanged: (page) {
              LogUtils.GGQ('page-->>>:${page}');
              controller.onChangePage(page);
            })
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    // final itemWidth = CommonUtils.getWidth()/5;
    final double itemWidth = getWidth() / 2;
    return BottomAppBar(
      elevation: 6,
      notchMargin: 6.0,
      color: Colors.white,
      shape: const CustomCircularNotchedRectangle(),
      child: Row(
        children: [
          SizedBox(height: 58.h, width: itemWidth, child: _buildItemBar(0)),
          SizedBox(height: 58.h, width: itemWidth, child: _buildItemBar(1)),
        ],
      ),
    );
  }

  Widget _buildItemBar(int index) {
    LogUtils.GGQ('---------->>${tabIcon[index]}');
    return MaterialButton(onPressed: (){
      controller.onJumpToPage(index);
    },
        splashColor: Colors.blueGrey.shade100,
        highlightColor: Colors.blueGrey.shade50,
        elevation: 1.2,
        shape: const CircleBorder(),
        child: _buildItemBox(index)
    );
  }

  Widget _buildItemBox (int index) {
    return Center(
      child: GetBuilder<HomeController>(
        id: 'navigator',
        builder: (_) => Container(
          child: (controller.currentIndex == index)? Lottie.asset(tabLottie[index], width: 52.w, height: 52.h, repeat: false): Image.asset(tabIcon[index], width: 52.w, height: 52.h),
        ),
      ),
    );
  }
}