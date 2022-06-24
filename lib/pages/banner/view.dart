import 'package:flutter/cupertino.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:ibase_app/common/base/base.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/widget/refresh/refresh.dart';
import 'package:ibase_app/pages/banner/banner.dart';

class BannerView extends BaseGetView<BannerController> {
  BannerView({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return _buildHeader(context,innerBoxIsScrolled);
        },
        body: _buildList(context),
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverPersistentHeader(
          delegate: _MySliverPersistentHeaderDelegate(),
        )
      ),
    ];
  }


  Widget _buildSearch() {
    return Container(
      height: 120.0,
      color: Colors.blue,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: const [
              Icon(Iconfont.location,size: 16.0,color: Colors.white,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text('当前位置',style: TextStyle(fontSize: 12.0,color: Colors.white),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 1.0)),
              Icon(Icons.arrow_forward_ios_sharp,size: 12,color:Colors.white),
              Spacer(),
              Icon(Iconfont.scan,size: 16.0,color: Colors.white,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text('会员码',style: TextStyle(fontSize: 12.0,color: Colors.white),)
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Row(
            children: [
              Expanded(child: Container(
                alignment: Alignment.center,
                height: 32.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(18.0),right:Radius.circular(18.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
                    const Icon(Icons.search,color: Colors.grey,size: 20,),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
                    const Text('搜索',style: TextStyle(color: Colors.grey,fontSize: 12.0),),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                        //圆角
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    16.0))),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.white,
                              width: 2.0),),
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      ),
                      onPressed: (){
                        ToastUtils.show('搜索');
                      },
                      child: const Text('搜索',style: TextStyle(color: Colors.white,fontSize: 12.0),),
                    )
                  ],
                ),
              )),
            ],
          ),
          Container(
            height: 36.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: const [
                Text('为你推荐',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
                Spacer(),
                Text('更多好货',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      color: Colors.redAccent,
      height: 120.0,
      child: Text('banner'),
    );
  }

  Widget _buildList(BuildContext context){
    return GetBuilder<BannerController>(
      id: 'refresh',
      builder: (_) => Refresh(
        enablePullDown: controller.enablePullDown,
        controller: controller.refreshController,
        onRefresh: () =>controller.onRefresh(),
        loadState: controller.loadState,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => (index == 0)? _buildBanner(): _buildItem(context,index - 1),
          itemCount: controller.list.length + 1,
        ),
        onRetry: ()=> controller.onRetry(),
      ),
    );
  }


  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      leading: ClipOval(
        child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(52,52)),
            child: ImageLoader.load(url: 'http://p2.music.126.net/1tSJODTpcbZvNTCdsn4RYA==/109951165034950656.jpg')),
      ),
      title: Text('wwwwww'),
      subtitle: Text('eeeee'),
      trailing: Text(index.toString()),
    );
  }
}

class _MySliverPersistentHeaderDelegate implements SliverPersistentHeaderDelegate{

  Widget _buildSearch() {
    return Container(
      height: 120.0,
      color: Colors.blue,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: const [
              Icon(Iconfont.location,size: 16.0,color: Colors.white,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text('当前位置',style: TextStyle(fontSize: 12.0,color: Colors.white),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 1.0)),
              Icon(Icons.arrow_forward_ios_sharp,size: 12,color:Colors.white),
              Spacer(),
              Icon(Iconfont.scan,size: 16.0,color: Colors.white,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text('会员码',style: TextStyle(fontSize: 12.0,color: Colors.white),)
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Row(
            children: [
              Expanded(child: Container(
                alignment: Alignment.center,
                height: 32.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(18.0),right:Radius.circular(18.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
                    const Icon(Icons.search,color: Colors.grey,size: 20,),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
                    const Text('搜索',style: TextStyle(color: Colors.grey,fontSize: 12.0),),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                        //圆角
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    16.0))),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.white,
                              width: 2.0),),
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      ),
                      onPressed: (){
                        ToastUtils.show('搜索');
                      },
                      child: const Text('搜索',style: TextStyle(color: Colors.white,fontSize: 12.0),),
                    )
                  ],
                ),
              )),
            ],
          ),
          Container(
            height: 36.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: const [
                Text('为你推荐',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
                Spacer(),
                Text('更多好货',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearch2(){
    return Container(
      height: 120.0,
      color: Colors.blue,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(child: Container(
                alignment: Alignment.center,
                height: 32.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(18.0),right:Radius.circular(18.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 6.0)),
                    const Icon(Icons.search,color: Colors.grey,size: 20,),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
                    const Text('搜索',style: TextStyle(color: Colors.grey,fontSize: 12.0),),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                        //圆角
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    16.0))),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.white,
                              width: 2.0),),
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                      ),
                      onPressed: (){
                        ToastUtils.show('搜索');
                      },
                      child: const Text('搜索',style: TextStyle(color: Colors.white,fontSize: 12.0),),
                    )
                  ],
                ),
              )),
            ],
          ),
          Container(
            height: 36.0,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: const [
                Text('为你推荐',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
                Spacer(),
                Text('更多好货',style: TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold, fontFamily: 'FZFWQingYinTiJWL',),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChild(Widget child){
    return child;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    LogUtils.GGQ('------shrinkOffset----->${shrinkOffset}');
    Widget child = _buildSearch2();
    if(shrinkOffset <= 10) {
      child = _buildSearch();
    }
    return _buildChild(child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;

}
