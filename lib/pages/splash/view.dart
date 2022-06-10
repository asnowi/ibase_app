import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'splash.dart';

class SplashView extends BaseGetView<SplashController> {
  SplashView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:getWidth(),
        height: getHeight(),
        color: Colors.white,
        child: Image.asset(AssetsProvider.imagePath('splash'),fit: BoxFit.fill)
      ),
    );
  }
}