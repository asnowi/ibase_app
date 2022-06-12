import 'package:ibase_app/common/http/http.dart';

class ApiService{
  /// 登录
  static Future<DioResponse>login (
      String phone,
      String password) async{
    return await DioUtil().request<DioResponse>('/login/cellphone',method: DioMethod.post,params: {
      'phone': phone,
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