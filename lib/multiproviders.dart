import 'package:circle/injection.dart';
import 'package:circle/presentation/providers/categories/category_provider.dart';
import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/providers/login/login_provider.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/providers/modify_account/modify_account_provider.dart';
import 'package:circle/presentation/providers/otp/otp_provider.dart';
import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/providers/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/details/details_provider.dart';

class GenerateMultiProviders extends StatelessWidget {
  final Widget child;

  const GenerateMultiProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<OtpProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<SignupProvider>()),
        ChangeNotifierProvider(
            create: (_) => getIt<MainProvider>()..loadUserData()),
        ChangeNotifierProvider(create: (_) => getIt<ProfileProvider>()),
        ChangeNotifierProvider(
          create: (_) => getIt<HomeProvider>()
            ..getCategories()
            ..getLatestProducts(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<CategoryProvider>()..getCategories(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<ProductsProvider>()
            ..getCategories()
            ..getLatestProducts(),
        ),
        ChangeNotifierProvider(create: (_) => getIt<DetailsProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ModifyAccountProvider>()),
      ],
      child: child,
    );
  }
}
