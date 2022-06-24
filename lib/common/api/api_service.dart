import 'package:ibase_app/common/http/http.dart';

class ApiService{
  /// 登录
  static Future<DioResponse>login (
      String username,
      String password) async{
    return await DioUtil().request<DioResponse>('/api/core/user/login',method: DioMethod.post,data: {
      'username': username,
      'password': password,
    });
  }


  ///  列表
  static Future<DioResponse>getArtistsList(
      int offset,
      int limit) async{
    return await DioUtil().request<DioResponse>('/top/artists',method: DioMethod.get,params: {
      'offset': offset,
      'limit': limit,
    });
  }
}