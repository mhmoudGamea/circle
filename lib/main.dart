import 'package:circle/presentation/views/splash/splash_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/app_theme/app_colors.dart';
import 'core/constants/constants.dart';
import 'injection.dart';
import 'multiproviders.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    GenerateMultiProviders(
      child: EasyLocalization(
        supportedLocales: Constants.langs,
        path: 'assets/translations',
        fallbackLocale: Constants.langs[1],
        startLocale: Constants.langs.first,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        fontFamily: 'MadaniArabic',
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: navigatorKey,
      home: SplashView(),
    );
  }
}
