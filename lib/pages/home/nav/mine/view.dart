import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';

import 'mine.dart';

class MineView extends GetView<MineController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: TextButton(
            child: Text('button'),
          onPressed: (){
              ConfigService.to.switchThemeModel();
          },
        ),
      ),
    );
  }

}