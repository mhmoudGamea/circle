import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/repositories/category_repository.dart';
import 'package:circle/data/repositories/home_repository.dart';
import 'package:circle/data/repositories/login_repository.dart';
import 'package:circle/data/repositories/signup_repository.dart';
import 'package:circle/presentation/providers/categories/category_provider.dart';
import 'package:circle/presentation/providers/details/details_provider.dart';
import 'package:circle/presentation/providers/home/home_provider.dart';
import 'package:circle/presentation/providers/login/login_provider.dart';
import 'package:circle/presentation/providers/main/main_provider.dart';
import 'package:circle/presentation/providers/otp/otp_provider.dart';
import 'package:circle/presentation/providers/products/products_provider.dart';
import 'package:circle/presentation/providers/profile/profile_provider.dart';
import 'package:circle/presentation/providers/signup/signup_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///interceptors
  getIt.registerLazySingleton(() => LoggingInterceptor());

  ///network
  getIt.registerLazySingleton(() => DioClient());

  ///repositories
  getIt.registerLazySingleton(
      () => LoginRepository(dioClient: getIt<DioClient>()));
  getIt.registerLazySingleton(
      () => SignupRepository(dioClient: getIt<DioClient>()));
  getIt.registerLazySingleton(
      () => HomeRepository(dioClient: getIt<DioClient>()));
  getIt.registerLazySingleton(
      () => CategoriesRepository(dioClient: getIt<DioClient>()));

  ///app providers
  getIt.registerLazySingleton(() => LoginProvider(getIt<LoginRepository>()));
  getIt.registerLazySingleton(() => OtpProvider());
  getIt.registerLazySingleton(() => SignupProvider(getIt<SignupRepository>()));
  getIt.registerLazySingleton(() => MainProvider());
  getIt.registerLazySingleton(() => ProfileProvider());
  getIt.registerLazySingleton(() => HomeProvider(getIt<HomeRepository>()));
  getIt.registerLazySingleton(
      () => CategoryProvider(getIt<CategoriesRepository>()));
  getIt.registerLazySingleton(() => ProductsProvider());
  getIt.registerLazySingleton(() => DetailsProvider());

  ///preference
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  ///repositories
}
