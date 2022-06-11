import 'package:flutter/physics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/langs/langs.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
import 'package:ibase_app/common/widget/refresh/page_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/app/app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize(),
      builder: (BuildContext context, Widget? child) {
        // return RefreshConfiguration(
        //   headerBuilder: () => const WaterDropHeader(),
        //   footerBuilder:  () => const ClassicFooter(),
        //   headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
        //   springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
        //   maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        //   maxUnderScrollExtent:0, // Maximum dragging range at the bottom
        //   enableScrollWhenRefreshCompleted: true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        //   enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
        //   hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
        //   enableBallisticLoad: true,
        //   child: GetMaterialApp(
        //     navigatorKey: navigatorKey,
        //     title: 'IBaseApp',
        //     debugShowCheckedModeBanner: false,
        //     theme: AppThemes.light,
        //     initialRoute: AppPages.INITIAL,
        //     getPages: AppPages.routes,
        //     unknownRoute: AppPages.unknownPage(),
        //     builder: EasyLoading.init(),
        //     navigatorObservers: [AppPages.observer],
        //     translations: TranslationService(),
        //     supportedLocales: ConfigService.to.languages,
        //     locale: ConfigService.to.locale,
        //     fallbackLocale: TranslationService.fallbackLocale,
        //     localizationsDelegates: TranslationService.localizationsDelegates,
        //     // 日志
        //     enableLog: true,
        //     logWriterCallback: LogUtils.write,
        //   ),
        // );

        return PageConfig.buildRefreshConfig(
            GetMaterialApp(
              navigatorKey: navigatorKey,
              title: 'IBaseApp',
              debugShowCheckedModeBanner: false,
              theme: AppThemes.light,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              unknownRoute: AppPages.unknownPage(),
              builder: EasyLoading.init(),
              navigatorObservers: [AppPages.observer],
              translations: TranslationService(),
              supportedLocales: ConfigService.to.languages,
              locale: ConfigService.to.locale,
              fallbackLocale: TranslationService.fallbackLocale,
              localizationsDelegates: TranslationService.localizationsDelegates,
              // 日志
              enableLog: true,
              logWriterCallback: LogUtils.write,
            ),
        );
      },
    );
  }
}