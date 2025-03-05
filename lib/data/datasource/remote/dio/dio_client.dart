import 'dart:convert';
import 'dart:io';
import 'package:circle/data/datasource/remote/exception/failure.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection.dart';
import '../../../../main.dart';
import '../../../AppUrls/app_urls.dart';
import 'logging_interceptor.dart';

class DioClient {
  late final String baseUrl;
  final LoggingInterceptor loggingInterceptor = getIt();
  final SharedPreferences sharedPreferences = getIt();
  late Dio dio;

  DioClient() {
    dio = Dio();
    dio
      ..options.baseUrl = AppUrls.baseUrl
      ..options.connectTimeout = const Duration(minutes: 5)
      ..options.receiveTimeout = const Duration(minutes: 5)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'lang': navigatorKey.currentContext!.locale.languageCode
      };
    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(String uri,
      {Map<String, dynamic>? queryParameters, CancelToken? cancelToken}) async {
    try {
      // Preferences preferences = Preferences();
      /*var model = preferences.getUserData();

      if(model!=null){
        print('AuthToken=>>>${model.auth}');
        dio.options.headers['Authorization'] =model.auth;

      }*/

      var response = await dio.get(uri,
          queryParameters: queryParameters, cancelToken: cancelToken);

      return response;
    } on SocketException catch (error) {
      throw ApiFailure(error.toString());
    } on FormatException catch (_) {
      throw ApiFailure("Unable to process the data");
    } on DioException catch (error) {
      throw ApiFailure.fromDioError(error);
    } catch (error) {
      throw ApiFailure(
          "Oops, there was an error, please try again later. $error");
    }
  }

  Future<Response> getUrl(String url) async {
    try {
      var response = await dio.get("");
      return response;
    } on SocketException catch (error) {
      throw ApiFailure(error.toString());
    } on FormatException catch (_) {
      throw ApiFailure("Unable to process the data");
    } on DioException catch (error) {
      throw ApiFailure.fromDioError(error);
    } catch (error) {
      throw ApiFailure(
          "Oops, there was an error, please try again later. $error");
    }
  }

  Future<Response> post(String uri,
      {FormData? formData,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    try {
      /*Preferences preferences = Preferences();
      var model = preferences.getUserData();
      if(model!=null){
        dio.options.headers['Authorization'] =model.auth;

      }*/
      var data = queryParameters ?? {};
      var response = await dio.post(uri,
          data: formData ?? FormData.fromMap(data), cancelToken: cancelToken);
      return response;
    } on FormatException catch (_) {
      throw ApiFailure("Unable to process the data");
    } on DioException catch (error) {
      throw ApiFailure.fromDioError(error);
    } catch (error) {
      throw ApiFailure(
          "Oops, there was an error, please try again later. $error");
    }
  }

  Future<Response> postRawData(
      String uri, Map<String, dynamic> modelData) async {
    try {
      /*Preferences preferences = Preferences();
      var model = preferences.getUserData();
       if(model!=null){
        dio.options.headers['Authorization'] =model.auth;

      }*/

      var response = await dio.post(uri, data: jsonEncode(modelData));
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      // Preferences preferences = Preferences();
      /* var model = preferences.getUserData();
      if(model!=null){
        dio.options.headers ={
          "lang":navigatorKey.currentContext!.locale.languageCode,
          "Authorization":model.auth,

        };
      }else{
        dio.options.headers ={
          "lang":navigatorKey.currentContext!.locale.languageCode,
        };
      }*/

      var response = await dio.put(uri, queryParameters: queryParameters);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      /* Preferences preferences = Preferences();
      var model = preferences.getUserData();
      if(model!=null){
        dio.options.headers ={
          "lang":navigatorKey.currentContext!.locale.languageCode,
          "Authorization":model.auth,

        };
      }else{
        dio.options.headers ={
          "lang":navigatorKey.currentContext!.locale.languageCode,
        };
      }*/

      var response = await dio.delete(uri, queryParameters: queryParameters);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
