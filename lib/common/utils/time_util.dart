import 'package:intl/intl.dart';

class TimeUtils {

  // 格式化日期到字符串 默认 yyyy-MM-dd
  static formatDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(DateTime.now());
  }
}