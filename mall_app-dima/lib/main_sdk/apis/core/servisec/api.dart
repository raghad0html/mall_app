import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/model.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:path_provider/path_provider.dart';

import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/utils/_dio_logging_interceptors.dart';

abstract class BaseUrlHandler {
  final String baseUrl = '';
}

typedef ParseJson<T> = T Function(dynamic json);

class API implements BaseUrlHandler {
  final Dio dio = Dio();

  API() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 50000; //50s
    dio.options.receiveTimeout = 30000;
    dio.interceptors.add(DioLoggingInterceptors(dio));
  }

  Future<ResponseState<T>> apiMethod<T>(String apiUrl,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      dynamic dataMedia,
      ResponseType? responseType,
      required HttpEnum httpEnum,
      required ParseJson<T> parseJson,
      bool isCache = false}) async {
    assert(T != dynamic);
    Options? _cacheOptions;
    if (isCache) {
      final options = CacheOptions(
        store: HiveCacheStore((await getApplicationDocumentsDirectory()).path), // Required.
        policy: CachePolicy.refresh,
        priority: CachePriority.normal,
        maxStale: const Duration(days: 365),
      );
      _cacheOptions = options.toOptions()..headers = headers;
      dio.interceptors.add(DioCacheInterceptor(options: options));
    }
    switch (httpEnum) {
      case HttpEnum.get:
        return await dio
            .get(apiUrl,
                queryParameters: queryParameters,
                options: isCache
                    ? _cacheOptions
                    : Options(
                        headers: headers,
                      ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));

      case HttpEnum.post:
        return await dio
            .post(apiUrl,
                data: dataMedia ?? data,
                queryParameters: queryParameters,
                options: Options(
                  headers: headers,
                  responseType: responseType,
                ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));
      case HttpEnum.put:
        return await dio
            .put(apiUrl,
                data: dataMedia ?? data,
                options: Options(
                  headers: headers,
                ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));
      case HttpEnum.patch:
        return await dio
            .patch(apiUrl,
                data: dataMedia ?? data,
                options: Options(
                  headers: headers,
                ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));

      case HttpEnum.delete:
        return await dio
            .delete(apiUrl,
                data: data,
                options: Options(
                  headers: headers,
                ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));

      default:
        return await dio
            .get(apiUrl,
                queryParameters: queryParameters,
                options: Options(
                  headers: headers,
                ))
            .then((response) {
          return ResponseState<T>.success(parseJson(response.data));
        }).catchError((error, stacktrace) => Model.catchError<T>(error, stacktrace));
    }
  }

  @override
  String get baseUrl => throw UnimplementedError();
}
