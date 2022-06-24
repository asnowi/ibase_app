import 'package:ibase_app/common/app/app.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/dialog/tip_dialog.dart';
import 'package:ibase_app/common/widget/text/icon_text.dart';

import 'mine.dart';

class MineView extends BaseGetView<MineController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
        return _buildHeader(context,innerBoxIsScrolled);
      },
        body: _buildContent(context),
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverAppBar(
          collapsedHeight: 120.h, // 小
          expandedHeight: 120.h, //大
          elevation: 0.8,
          floating: false,//是否随着滑动隐藏标题
          pinned: true,//是否让标题固定在顶部
          backgroundColor: Colors.redAccent,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<MineController>(
                      id: 'user',
                      builder: (_) => controller.isHiveUser? _buildLogined():_buildUnLogin()
                  ),
                );
              })
      )
    ];
  }


  Widget _buildUnLogin(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(72,72)),
            child: Image.asset(AssetsProvider.imagePath('img_avatar_default')),
          ) ,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
        Container(
          padding: EdgeInsets.only(left: 5.w),
          child: TextButton(
            onPressed: (){
              _openLogin();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent[100])
            ),
            child: Text('请登录',style: TextStyle(fontSize: 14.sp,color: Colors.white),),
          ),
        )
      ],
    );
  }

  Widget _buildLogined(){
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size(72,72)),
              child: (controller.user?.avatarImg != null)? ImageLoader.load(url: controller.user!.avatarImg!): Image.asset(AssetsProvider.imagePath('img_avatar_default')),
            ) ,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Container(
            width: getWidth() /2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((controller.user?.username != null)? controller.user!.username!:'',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'FZDaLTJ',fontWeight: FontWeight.bold),),
                Text((controller.user?.avatarImg != null)? controller.user!.avatarImg!:'',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12,color: Colors.white60),),
              ],
            ),
          )
        ],
      ),
      onTap: (){
        ToastUtils.showBar('用户信息');
      },
    );
  }

  Widget _buildContent(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 12, 10,8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text('0',style: TextStyle(fontSize: 12),),
                      Text('动态',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: const [
                      Text('0',style: TextStyle(fontSize: 12),),
                      Text('关注',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: const [
                      Text('0',style: TextStyle(fontSize: 12),),
                      Text('粉丝',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(height: 100.h,color: Colors.grey[50],),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  IconText(txt: '我的位置',icon: const Icon(Iconfont.location,size: 14,color: Colors.black54),onClick: (){
                    if(controller.isHiveUser) {
                      ToastUtils.show('我的位置');
                    } else {
                      _openLogin();
                    }
                  },),
                  Divider(height: 5,color: Colors.grey[50],thickness: 1,indent: 30,),
                  IconText(txt: '我的收藏',icon: const Icon(Iconfont.about,size: 14,color: Colors.black54),onClick: (){
                    if(controller.isHiveUser) {
                      ToastUtils.show('我的收藏');
                    } else {
                      _openLogin();
                    }
                  },),
                  Divider(height: 5,color: Colors.grey[50],thickness: 1,indent: 30,),
                  IconText(txt: '设置',icon: const Icon(Iconfont.carUp,size: 14,color: Colors.black54),onClick: (){
                    if(controller.isHiveUser) {
                      _openSetting();
                    } else {
                      _openLogin();
                    }
                  },),
                  Divider(height: 5,color: Colors.grey[50],thickness: 1,indent: 30,),
                  IconText(txt: '版本',icon: const Icon(Iconfont.about,size: 14,color: Colors.black54),
                    centerChild: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 10.w),
                      child: GetBuilder<MineController>(
                        id: 'version',
                        builder: (_) => Text(controller.version,style: TextStyle(fontSize: 12.sp,color: Colors.black87),),
                      ),
                    ),
                    onClick: (){
                      ToastUtils.show(controller.version);
                    },),
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(onPressed: (){
                      if(controller.isHiveUser) {
                        //  退出登录
                        _showLogout(context);
                      } else {
                        _openLogin();
                      }
                    },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(getWidth() * 0.72, 46.h)),
                            backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                        ), child: GetBuilder<MineController>(
                          id: 'user',
                          builder: (_) => Text(controller.isHiveUser? '退出登录': '请登录',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        )
                    ),
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  void _showLogout(BuildContext context) {
    TipDialog.show(() async{
        LogUtils.GGQ('==onConfirm==>>>>');
        bool? result = await Global.dbUtil?.clearUser();
        if(result != null && result) {
          controller.clearUser();
          TipDialog.dismiss();
        } else {
          ToastUtils.show('退出失败!');
        }
      },content: '您确定要退出账号?',confirm: '确定退出?',cancel: '再看一看');
  }

  void _openLogin() {
    Get.toNamed(AppRoutes.LOGIN);
  }

  void _openSetting(){
    Get.toNamed(AppRoutes.SETTING);
  }














  // void _showLogout(BuildContext context) {
  //   showCupertinoDialog(
  //       context: context,
  //       builder: (context) {
  //         return Theme(data: ThemeData.light(), child: CupertinoAlertDialog(
  //           insetAnimationDuration: const Duration(seconds: 2),
  //           title: const Text('温馨提示', style: TextStyle(fontSize: 14),),
  //           content: const Text('您确定要退出账号？', style: TextStyle(fontSize: 14)),
  //           actions: [
  //             CupertinoDialogAction(child: const Text(
  //                 '确定', style: TextStyle(fontSize: 12, color: Colors.blue)),
  //               onPressed: () async {
  //                 // int value = await Global.dbUtil.userBox.clear();
  //                 // Global.userInfo = null;
  //                 //
  //                 // LogUtils.GGQ('删除用户：${value}');
  //                 // Navigator.of(context).pop();
  //                 // //发送事件
  //                 // final event = CommonEvent(EventCode.EVENT_LOGIN,message: value.toString());
  //                 // EventBusUtils.send(event);
  //
  //                 bool? result = await Global.dbUtil?.clearUser();
  //                 if(result != null && result) {
  //                   controller.clearUser();
  //                   Navigator.of(context).pop();
  //                 } else {
  //                   ToastUtils.show('退出失败!');
  //                 }
  //               },),
  //             CupertinoDialogAction(child: const Text(
  //                 '取消', style: TextStyle(fontSize: 12, color: Colors.blue)),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         ));
  //       }
  //   );
  // }

}