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
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        elevation: 2.0,
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

  Widget _buildContent(){
    return GetBuilder<FirstController>(
        id: 'refresh',
        builder: (_) => Refresh(
          enablePullDown: controller.enablePullDown,
          enablePullUp: controller.enablePullUp,
          controller: controller.refreshController,
          onRefresh: () =>controller.onRefresh(),
          onLoadMore: () =>controller.onLoadMore(),
          loadState: controller.loadState,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => _buildItem(context,index),
            itemExtent: 90.0,
            itemCount: controller.list.length,
          ),
          onRetry: ()=> controller.onRetry(),
        ),
    );
  }

  Widget _buildItem(BuildContext context,int index){
    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.only(top: 10.0,bottom: 2.0,left: 12.0,right: 12.0),
        shadowColor: Colors.blueGrey,
        color: Colors.white,
        child: TextButton(
            onPressed: ()=> controller.onItemClick(controller.list[index].id),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.list[index].title,style: TextStyle(fontSize: 14.sp,color: Colors.black87,fontWeight: FontWeight.bold)),
                    Text(controller.list[index].describe,style: TextStyle(fontSize: 12.sp,color: Colors.black54)),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                        Text(controller.list[index].time,style: TextStyle(fontSize: 10.sp,color: Colors.redAccent.shade100))
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}