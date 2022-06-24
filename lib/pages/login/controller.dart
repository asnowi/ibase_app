import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/api/api.dart';
import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/config/config.dart';
import 'package:ibase_app/common/db/db.dart';
import 'package:ibase_app/common/entity/entity.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/button/loading_button.dart';
import 'package:video_player/video_player.dart';

class LoginController extends BaseGetController with WidgetsBindingObserver{


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
    WidgetsBinding.instance.addObserver(this);
    // videoPlayerController = VideoPlayerController.network(AppConfig.VIDEO_URL);
    videoPlayerController = VideoPlayerController.asset(AssetsProvider.loadVideo('video-login-hd'));
    loadingButton = LoadingButton(text: '登录', width: 0.82.sw,height: 48.h,textStyle: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.normal,fontFamily: 'FZDaLTJ'),onPressed: (BuildContext context) {
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

      if(!isAgree){
        ToastUtils.show('请阅读并同意用户使用协议和隐私条款!');
        return;
      }

      loadingButton.onLoading();
      LogUtils.GGQ('--账号:--->${account}');
      LogUtils.GGQ('--密码:--->${password}');
      FocusScope.of(context).unfocus();

      ApiService.login(account, password).then((value) async{
        LogUtils.GGQ('------登录结果:------>>>${value}');
        if(ResponseUtils.isSuccess(value.code)) {
            final entity = LoginEntity.fromJson(value.data['user']);
            final User user = User();
            user.userId = entity.userId;
            user.token = entity.token;
            user.username = entity.username;
            user.phone = entity.phone;
            user.avatarImg = entity.avatarUrl;

            LogUtils.GGQ('------登录结果:------>>>${user.username}');
            LogUtils.GGQ('------登录结果:------>>>${entity.username}');

            final int? result = await Global.dbUtil?.saveUser(user);
            if(result != null && result >= 0) {
              Global.user = Global.dbUtil?.getUser();
              EventBusUtils.send<CommonEvent>(CommonEvent(EventCode.EVENT_LOGIN));
              Get.back();
            } else {
              ToastUtils.showBar('保存用户信息失败！');
            }
        } else {
          ToastUtils.showBar(ResponseUtils.getMessage(value.message));
        }
      }).whenComplete(() => {
        loadingButton.onCancel()
      });
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    LogUtils.GGQ('--GetxController 生命周期:--${state}');
    if (state == AppLifecycleState.resumed) {
      LogUtils.GGQ('app进入前台');
      videoPlayerController.play();
    } else if (state == AppLifecycleState.paused) {
      LogUtils.GGQ('app进入后台');
      videoPlayerController.pause();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    videoPlayerController.dispose();
    super.dispose();
  }

}