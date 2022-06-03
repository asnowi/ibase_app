import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';
import 'package:video_player/video_player.dart';

class LoginController extends GetxController{

  final LoadingButton loadingButton = LoadingButton(text: '登录', width: 0.82.sw,height: 48.h,textStyle: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'FZDaLTJ'),onPressed: (){
    Get.toNamed(AppRoutes.LOGIN);
  });

  void onLoadCancel() {
    loadingButton.onCancel();
  }


  // 声明视频控制器
  late VideoPlayerController videoPlayerController;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  void onInit() {
    // videoPlayerController = VideoPlayerController.network(AppConfig.VIDEO_URL);
    videoPlayerController = VideoPlayerController.asset(AssetsProvider.loadVideo('video-login-hd'));
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