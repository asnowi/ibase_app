import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddlewares extends GetMiddleware{
  // priority 数字小优先级高
  @override
  var priority = 0;

  AuthMiddlewares({required this.priority});



  // @override
  // RouteSettings? redirect(String? route) {
  //   if (Global.profile.accessToken != null ||
  //       route == AppRoutes.SIGN_IN ||
  //       route == AppRoutes.SIGN_UP ||
  //       route == AppRoutes.INITIAL) {
  //     return null;
  //   } else {
  //     Future.delayed(
  //         Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
  //     return RouteSettings(name: AppRoutes.SIGN_IN);
  //   }
  // }

}
