import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';

import 'mine.dart';

class MineView extends GetView<MineController>{

  final LoadingButton _loadingButton = LoadingButton(text: '登录',onPressed: (){
    // Get.toNamed(AppRoutes.LOGIN);
    ToastUtils.show('msg');
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _loadingButton,
            TextButton(onPressed: (){
              _loadingButton.onCancel();
            }, child: Text('cancel'))
          ],
        )
      ),
    );
  }
}