import 'package:ibase_app/common/http/http.dart';

class ResponseUtils {

  static bool isSuccess(int? code){
    if(code == null) return false;
    return code == DioResponseCode.SUCCESS;
  }

  static String getMessage(String? msg){
    if(msg == null) {
      return '操作失败!!!';
    }
    return msg;
  }
}