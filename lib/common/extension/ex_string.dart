import 'package:flutter/material.dart';

/// 扩展 String
extension ExString on String {
  /// 生成 Color
  Color get toColor {
    return Color(int.parse(this, radix: 16) | 0xFF000000);
  }
}