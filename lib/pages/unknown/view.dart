import 'package:flutter/material.dart';
import 'package:ibase_app/common/base/base.dart';

import 'unknown.dart';

class UnknownView extends BaseGetView<UnknownController>{
  UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('未知页')),
    );
  }

}