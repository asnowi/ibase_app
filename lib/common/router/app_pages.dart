import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/pages/home/home.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';
import 'package:ibase_app/pages/home/nav/mine/mine.dart';
import 'package:ibase_app/pages/list/list.dart';
import 'package:ibase_app/pages/login/login.dart';
import 'package:ibase_app/pages/setting/setting.dart';
import 'package:ibase_app/pages/splash/splash.dart';
import 'package:ibase_app/pages/unknown/unknown.dart';
import 'package:ibase_app/pages/welcome/welcome.dart';

import 'package:ibase_app/pages/list/view.dart' as View;

import 'router.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  /// 路由初始页
  static const INITIAL = AppRoutes.SPLASH;

  //页面跳转动画时长
  static const Duration _transitionDuration = Duration(milliseconds: 300);

  static final List<GetPage> routes = [

    /// 启动页
    GetPage(
      name: INITIAL,
      page: () => SplashView(),
      binding: SplashBinding()
    ),

    /// 登录页
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transitionDuration: _transitionDuration
    ),

    /// 欢迎页
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
    ),

    /// 首页
    GetPage(
        name: AppRoutes.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        bindings: [FirstBinding(),MineBinding()],
        children: [
          GetPage(
              name: AppRoutes.HOME_FIRST,
              page: () => FirstView(),
              binding: FirstBinding()
          ),
          GetPage(
              name: AppRoutes.HOME_MINE,
              page: () => MineView(),
              binding: MineBinding()
          )
        ]
    ),

    /// 设置页
    GetPage(
        name: AppRoutes.SETTING,
        page: () => SettingView(),
        binding: SettingBinding(),
    ),

    //// demo
    GetPage(
      name: AppRoutes.LIST,
      page: () => View.ListView(),
      binding: ListBinding(),
    ),
  ];



  // // 未知页
  static GetPage unknownPage(){
    return GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => UnknownView(),
    binding: UnknownBinding(),
    transition: Transition.fadeIn);
  }
}