class LogUtils {
  static void GGQ (dynamic msg) {
    if(msg != null) {
      StringBuffer sb = StringBuffer();
      sb.write('GGQ->:');
      sb.write(msg);
      print(sb.toString());
    }
  }

  static void write(String text, {bool isError = false}) {
    Future.microtask(() => print('** $text. isError: [$isError]'));
  }
}