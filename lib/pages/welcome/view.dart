import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'welcome.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);

  final pageController = PageController(initialPage: 0,viewportFraction: 1, keepPage: true);

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
          controller: pageController,
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

  Widget _buildIndicator(){
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 90.h),
      child: SmoothPageIndicator(
        controller: pageController,
        count: 4,
        effect: const WormEffect(
            dotHeight: 6,
            dotWidth: 6,
            type: WormType.thin,
            strokeWidth: 17,
            dotColor: Colors.black26,
            activeDotColor: Colors.redAccent
        ),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context, int index) {
    if (index == 1) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetsProvider.imagePath('welcome_1'), fit: BoxFit.none),
          _buildIndicator()
        ],
      );
    }
    if (index == 2) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetsProvider.imagePath('welcome_2'), fit: BoxFit.none),
          _buildIndicator()
        ],
      );
    };
    if (index == 3) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AssetsProvider.imagePath('welcome_3'), fit: BoxFit.none),
          _buildIndicator()
        ],
      );
    }
    else {
      return Stack(
        children: [
          ConstrainedBox(constraints: const BoxConstraints.expand(),child: Image.asset(AssetsProvider.imagePath('welcome_4'), fit: BoxFit.none)),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 90.h),
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