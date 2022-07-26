import 'package:ibase_app/common/http/http.dart';

class ApiService{
  /// 登录
  static Future<DioResponse>login (
      String username,
      String password) async{
    return await DioUtil().request<DioResponse>('/api/core/user/login',method: DioMethod.post,data: {
      'username': username,
      'password': password,
    },hasShowLoading: false);
  }

  /// 退出登录
  static Future<DioResponse>logout() async{
    return await DioUtil().request<DioResponse>('/api/core/user/logout',method: DioMethod.post, hasShowLoading: false);
  }


  /// 列表
  static Future<DioResponse> getUserLoginRecordList(
      int page,
      int limit) async{
    return await DioUtil().request<DioResponse>('/api/core/userLoginRecord/list',method: DioMethod.get,params: {
      'keyword': '',
      'page': page,
      'limit' : limit
    },hasShowLoading: false);
  }

  /// 检查版本
  static Future<DioResponse> getAppVersion(String appId,String appType) async{
    return await DioUtil().request<DioResponse>('/api/core/appInfo/checkAppVersion',method: DioMethod.get,params: {
      'appId': appId,
      'appType': appType,
    });
  }
}