import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'welcome.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  List<Widget> _list(context) {
    return [
      _buildWelcome(context, 1),
      _buildWelcome(context, 2),
      _buildWelcome(context, 3),
      _buildWelcome(context, 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: Get.width,
        height: Get.height,
        child: PageView(
          scrollDirection: Axis.horizontal,
          reverse: false,
          controller: PageController(
            initialPage: 0,
            viewportFraction: 1,
            keepPage: true,
          ),
          physics: const BouncingScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (index) {
            //监听事件
            LogUtils.GGQ('index=====$index');
          },
          children: _list(context),
        ),
      ),
    );
  }


  Widget _buildWelcome(BuildContext context, int index) {
    if (index == 1) return Image.asset(AssetsProvider.imagePath('welcome_1'), fit: BoxFit.cover);
    if (index == 2) return Image.asset(AssetsProvider.imagePath('welcome_2'), fit: BoxFit.cover);
    if (index == 3)
      return Image.asset(AssetsProvider.imagePath('welcome_3'), fit: BoxFit.cover);
    else {
      return Stack(
        children: [
          ConstrainedBox(constraints: const BoxConstraints.expand(),child: Image.asset(AssetsProvider.imagePath('welcome_4'), fit: BoxFit.cover)),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 30.h),
            child: TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 18.sp,
                )),
                minimumSize: MaterialStateProperty.all(Size(Get.width * 0.72, 54.h)),
                foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                    if (states.contains(MaterialState.focused) &&
                        !states.contains(MaterialState.pressed)) {
                      return Colors.grey[300];
                    } else if (states.contains(MaterialState.pressed)) {
                      return Colors.white60;
                    }
                    return Colors.white;
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.redAccent[100];
                  }
                  return Colors.redAccent[100];
                }),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                )),
              ),
              child: const Text('开启旅程',style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: 'Montserrat',
              ),),
              onPressed: () {
                  Get.offAndToNamed(AppRoutes.HOME);
              },
            ),
          )
        ],
      );
    }
  }
}