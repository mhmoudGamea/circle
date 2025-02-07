import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/config/constants.dart';
import 'core/services/navigation_service.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: Constants.langs,
      path: 'assets/translations',
      fallbackLocale: Constants.langs.first,
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Circle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'MadaniArabic',
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: NavigationService.router,
    );
  }
}
