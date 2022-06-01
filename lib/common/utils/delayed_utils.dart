import 'dart:ui';

//延时执行
class DelayedUtils{

  static delayed(VoidCallback voidCallback,{int milliseconds = 2000}){
    // 延时milliseconds执行返回
    Future.delayed(Duration(milliseconds: milliseconds),voidCallback);
  }
//  使用: DelayedUtil.delayed(3000, () { });
}