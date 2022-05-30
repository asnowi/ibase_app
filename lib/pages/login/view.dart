import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(
          child: Text('login')
        ),
      );
  }
}