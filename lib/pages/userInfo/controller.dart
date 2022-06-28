import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/logger.dart';
import 'package:image_picker/image_picker.dart';

class UserInfoController extends BaseGetController{

  final ImagePicker _picker = ImagePicker();

  void showImagePicker() async{
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if(file != null) {
      String path = file.path;
      LogUtils.GGQ('path--->${path}');
    }
  }

}