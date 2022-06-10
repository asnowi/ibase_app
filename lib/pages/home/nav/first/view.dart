import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/pages/home/nav/first/first.dart';

class FirstView extends BaseGetView<FirstController>{

  FirstView({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: AppStyles.titleStyle,
        iconTheme: const IconThemeData(color: Colors.redAccent,size: 20.0),
        backgroundColor: Colors.white,
        title: const Text('首页'),
        actions: [
          IconButton(onPressed: (){
            ToastUtils.show('scan');
          },
          splashRadius: 22.0,
          icon: const Icon(Iconfont.scan))
        ],
      ),
      body: _buildContent(),
    );
  }

  // ListView.builder(itemBuilder: (BuildContext context, int index) => _buildItem(context,index),itemCount: 5);
  // scrollDirection: Axis.vertical,
  // physics: NeverScrollableScrollPhysics(),
  
  Widget _buildContent(){
    return GetBuilder<FirstController>(
      id: 'list',
      builder: (_) => controller.list.isNotEmpty? Refresh(
        controller: controller.refreshController,
        enablePullDown: controller.enablePullDown,
        enablePullUp: controller.enablePullUp,
        onRefresh: ()=> controller.onRefresh(),
        onLoading: ()=> controller.onLoading(),
        content: ListView.builder(
          itemBuilder: (BuildContext context,int index) => _buildItem(context,index),itemCount: 5),
      ): const Center(child: SizedBox(width: 28.0,height: 28.0,child: CircularProgressIndicator(strokeWidth: 2.0,color: Colors.redAccent,)),),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Text(index.toString());
  }



}