import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/pages/userInfo/userInfo.dart';

class UserInfoView extends BaseGetView<UserInfoController>{

  UserInfoView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: AppStyles.titleStyle,
        iconTheme: const IconThemeData(color: Colors.black38,size: 20.0),
        backgroundColor: Colors.white,
        title: Text('个人信息'),
        leading: IconButton(
          splashRadius: 22.0,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: _buildContent(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeader(),
          const Divider(height: 4.0,color: Colors.black12,thickness: 4.0),

        ],
      ),
    );
  }

 Widget _buildHeader() {
    return GestureDetector(
      onTap: (){
       // ToastUtils.show('msg');
        controller.showImagePicker();
      },
      child: Container(
        width: getWidth(),
        height: 160.0,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.orangeAccent, width: 8.0),
                  gradient: const LinearGradient(colors: [Colors.cyan, Colors.black, Colors.orangeAccent], begin: FractionalOffset(1, 0), end: FractionalOffset(0, 1)),
                  borderRadius: BorderRadius.circular(43.0)),
              child: ClipOval(
                child: ConstrainedBox(
                  constraints: BoxConstraints.loose(const Size(72,72)),
                  child: Image.asset(AssetsProvider.imagePath('img_avatar_default')),
                ) ,
              ),
            ),
            Positioned(
              bottom: 2.0,
              right: 4.0,
              child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1.0),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15.0)),
                child: const Icon(Icons.camera_alt,size: 16.0,color:Colors.white)),
            )
          ],
        ),
      ),
    );
 }

}