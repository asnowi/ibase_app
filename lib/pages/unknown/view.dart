import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'unknown.dart';

class UnknownView extends GetView<UnknownController>{
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('未知页')),
    );
  }

}