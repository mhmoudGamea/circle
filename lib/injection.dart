import 'package:circle/presentation/providers/component/component_provider.dart';
import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/providers/login/login_provider.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/providers/otp/otp_provider.dart';
import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/providers/signup/signup_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => LoginProvider());
  getIt.registerLazySingleton(() => OtpProvider());
  getIt.registerLazySingleton(() => SignupProvider());
  getIt.registerLazySingleton(() => MainProvider());
  getIt.registerLazySingleton(() => ProfileProvider());
  getIt.registerLazySingleton(() => HomeProvider());
  getIt.registerLazySingleton(() => ComponentProvider());
  getIt.registerLazySingleton(() => ProductsProvider());

  ///preference
  // final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerLazySingleton(() => sharedPreferences);

  ///network
  // getIt.registerLazySingleton(() => Dio());

  ///repositories
}
