
class DioResponse<Object> {

  /// 自定义code(可根据内部定义方式)
  final int? code;
  /// 消息(例如成功消息文字/错误消息文字)
  final String? msg;
  /// 接口返回的数据
  final Object? data;
  /// 需要添加更多
  /// .........
  DioResponse({
    this.code,
    this.msg,
    this.data,
  });


  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"msg\":\"$msg\"");
    sb.write(",\"code\":\"$code\"");
    sb.write(",\"data\":\"${data.toString()}\"");
    sb.write('}');
    return sb.toString();
  }
}

class DioResponseCode {
  /// 成功
  static const int SUCCESS = 200;
  /// 错误
  static const int ERROR = -1;
/// 更多
}