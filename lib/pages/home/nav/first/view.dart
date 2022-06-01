import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';

class FirstView extends GetView<FirstController>{

  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('first'),
    );
  }

}