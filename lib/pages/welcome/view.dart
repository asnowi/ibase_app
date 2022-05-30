import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'welcome.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            controller.toHome();
          },
          child: const Text('确定'),
        ),
      ),
    );
  }

}