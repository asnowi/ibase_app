import 'package:dio/dio.dart';
import 'package:ibase_app/common/config/const.dart';

import 'http.dart';

class DioTokenInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers['refreshToken'] == null) {
      DioUtil.getInstance()?.dio.lock();
      Dio _tokenDio = Dio();
      _tokenDio..get(Global.BASE_URL + "/getRefreshToken").then((d) {
        options.headers['refreshToken'] = d;
        handler.next(options);
      }).catchError((error, stackTrace) {
        handler.reject(error, true);
      }) .whenComplete(() {
        DioUtil.getInstance()?.dio.unlock();
      }); // unlock the dio
    } else {
      options.headers['refreshToken'] = options.headers['refreshToken'];
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {

    // 响应前需要做刷新token的操作

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}