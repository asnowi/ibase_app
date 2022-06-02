import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';

import 'mine.dart';

class MineView extends GetView<MineController>{

  final LoadingButton loadingButton = LoadingButton(text: '登录',onPressed: (){
    ToastUtils.show('loading');
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: loadingButton,
      ),
    );
  }
}