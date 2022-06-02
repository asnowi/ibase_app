import 'package:flutter/material.dart';
import 'package:ibase_app/common/utils/utils.dart';

class AppThemes {

  /// 亮色
  static ThemeData light = ThemeData(
    // colorScheme: const ColorScheme.light(
    // ),
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.white60,
        ),
  );


  /// 暗色
  static ThemeData dark = ThemeData(
    // colorScheme: const ColorScheme.dark(
    // ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.black87,
    ),
  );

}