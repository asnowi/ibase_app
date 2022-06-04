import 'package:get/get.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/text/icon_text.dart';

import 'mine.dart';

class MineView extends GetView<MineController> {


  @override
  Widget build(BuildContext context) {
    // return NestedScrollView(
    //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
    //     return _buildHeader(context,innerBoxIsScrolled);
    //   },
    //   body: _buildContent(context),
    // );

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
          collapsedHeight: 120.h,
          expandedHeight: 120.h,
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
                      builder: (_) => controller.user == null? _buildUnLogin(): _buildLogined()
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
              Get.toNamed(AppRoutes.LOGIN);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent[100])
            ),
            child: Text('请先登录',style: TextStyle(fontSize: 14.sp,color: Colors.white),),
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
              child: (controller.user != null && controller.user?.avatarImg != null)? ImageLoader.load(url: controller.user!.avatarImg!): Image.asset(AssetsProvider.imagePath('img_avatar_default')),
            ) ,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Container(
            width: getWidth() /2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((controller.user != null && controller.user?.phone != null)? controller.user!.phone!:'',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'FZDaLTJ',fontWeight: FontWeight.bold),),
                Text((controller.user != null && controller.user?.avatarImg != null)? controller.user!.avatarImg!:'',overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12,color: Colors.white60),),
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
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                IconText(txt: '我的位置',icon: const Icon(Iconfont.location,size: 14,color: Colors.black54),onClick: (){
                  ToastUtils.show('我的位置');
                },),
                Divider(height: 5,color: Colors.grey[50],thickness: 1,indent: 30,),
                IconText(txt: '我的收藏',icon: const Icon(Iconfont.about,size: 14,color: Colors.black54),onClick: (){
                  ToastUtils.show('我的收藏');
                },),
                Divider(height: 5,color: Colors.grey[50],thickness: 1,indent: 30,),
                IconText(txt: '版本',icon: const Icon(Iconfont.about,size: 14,color: Colors.black54),onClick: (){
                  ToastUtils.show('版本');
                },),
                const Padding(padding: EdgeInsets.only(top: 50)),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ElevatedButton(onPressed: (){
                    //  退出登录
                    ToastUtils.show('退出登录');
                  },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(getWidth() * 0.72, 46.h)),
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                    ), child: const Text('退出登录',style: TextStyle(color: Colors.white,fontSize: 14),),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}