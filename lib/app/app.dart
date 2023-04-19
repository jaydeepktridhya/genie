import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../generated/i18n.dart';
import '../routes/app_pages.dart';
import '../utils/app_constants.dart';
import '../views/splash/splash_binding.dart';
import 'app_controller.dart';

class MyApp extends GetView<AppController> {
  MyApp({Key? key}) : super(key: key);

  final AppController _controller = Get.put(AppController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        primarySwatch: appColor,
      ),
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
            child: child!, data: data.copyWith(textScaleFactor: 1));
      },
      locale: Locale(_controller.locale),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      title: AppConstants.appName,
      initialBinding: SplashBinding(),
    );
  }
}
