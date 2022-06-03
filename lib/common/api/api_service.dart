import 'package:ibase_app/common/http/http.dart';
import 'package:ibase_app/common/utils/logger.dart';

class ApiService{
  /// 登录
  static Future<DioResponse<String>> login(
      String username,
      String password) async{
    return DioUtil().request('/user/login',method: DioMethod.post,params: {
      'username': username,
      'password': password,
    },onBefore: (){
      LogUtils.GGQ('----登录------->>onBefore');
    },onComplete: (){
      LogUtils.GGQ('----登录------->>onComplete');
    });
  }

}