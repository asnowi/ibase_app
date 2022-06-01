import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ibase_app/common/langs/langs.dart';
import 'package:ibase_app/common/router/router.dart';
import 'package:ibase_app/common/service/service.dart';
import 'package:ibase_app/common/utils/utils.dart';
import 'package:ibase_app/common/values/values.dart';
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
        return RefreshConfiguration(
          headerBuilder: () => const ClassicHeader(),
          footerBuilder:  () => const ClassicFooter(),
          hideFooterWhenNotFull: true,
          headerTriggerDistance: 80,
          maxOverScrollExtent: 100,
          footerTriggerDistance: 150,
          child: GetMaterialApp(
            navigatorKey: navigatorKey,
            title: 'IBaseApp',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            unknownRoute: AppPages.unknownPage(),
            builder: EasyLoading.init(),
            translations: TranslationService(),
            navigatorObservers: [AppPages.observer],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: ConfigService.to.languages,
            locale: ConfigService.to.locale,
            fallbackLocale: TranslationService.fallbackLocale,
            // 日志
            enableLog: true,
            logWriterCallback: LogUtils.write,
          ),
        );
      },
    );
  }
}