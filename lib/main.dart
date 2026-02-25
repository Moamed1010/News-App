import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'core/networking/dio_helper.dart';
import 'core/routing/router_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. تهيئة الـ Dependency Injection
  setupServiceLocator();

  // 2. تهيئة الترجمة والـ API
  await EasyLocalization.ensureInitialized();
  DioHelper.initDio();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale(Constants.language),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'News App',
          routerConfig: RouterGenerator.goRouter,
        );
      },
    );
  }
}
