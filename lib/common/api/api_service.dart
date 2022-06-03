import 'package:ibase_app/common/entity/entity.dart';
import 'package:ibase_app/common/http/http.dart';

class ApiService{
  /// 登录
  static Future<DioResponse<LoginEntity>> login (
      String username,
      String password) async{
    return await DioUtil().request('/user/login',method: DioMethod.post,params: {
      'username': username,
      'password': password,
    });
  }

}