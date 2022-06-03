import 'package:get/get.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';
import 'package:video_player/video_player.dart';

class LoginController extends GetxController{


  // 声明视频控制器
  late VideoPlayerController videoPlayerController;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


   late LoadingButton loadingButton;

  void onLoadCancel() {
    loadingButton.onCancel();
  }


  @override
  void onInit() {
    // videoPlayerController = VideoPlayerController.network(AppConfig.VIDEO_URL);
    videoPlayerController = VideoPlayerController.asset(AssetsProvider.loadVideo('video-login-hd'));
    loadingButton = LoadingButton(text: '登录', width: 0.82.sw,height: 48.h,textStyle: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'FZDaLTJ'),onPressed: (BuildContext context){
      final String account = accountController.text;
      if(account.isEmpty) {
        ToastUtils.show('请输入账号!');
        return;
      }
      final String password = passwordController.text;
      if(password.isEmpty) {
        ToastUtils.show('请输入密码!');
        return;
      }
      loadingButton.onLoading();

      LogUtils.GGQ('--账号:--->${account}');
      LogUtils.GGQ('--密码:--->${password}');
      FocusScope.of(context).unfocus();
    });
    super.onInit();
  }

  @override
  void onReady() {
    videoPlayerController.initialize().then((value){
      update(['player']);
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    });
    super.onReady();
  }

  bool isClose = false;
  void changeClose(bool isClose) {
    this.isClose = isClose;
    update(['close']);
  }


  bool isAccount = false;
  void setAccount(bool isAccount) {
    this.isAccount = isAccount;
    update(['account']);
  }

  bool isPassword = false;
  void setPassword(bool isPassword) {
    this.isPassword = isPassword;
    update(['password']);
  }


  bool isEye = true;
  void setEye(){
    isEye = !isEye;
    update(['password']);
  }

  bool isAgree = true;
  void setAgree(bool isAgree) {
    this.isAgree = isAgree;
    update(['agree']);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

}