import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'mine.dart';

class MineView extends GetView<MineController> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.loadingButton,
            TextButton(onPressed: (){
              controller.onLoadCancel();
            }, child: Text('cancel'))
          ],
        )
      ),
    );
  }

}