// ignore_for_file: void_checks
import 'package:dio/dio.dart';

class DioInterceptor {
  Dio? _dio;

  DioInterceptor();

  Dio getDioInstance() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(connectTimeout: 30000, receiveTimeout: 30000));
      _dio?.interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            return requestInterceptor(options, handler);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            return responseInterceptor(response, handler);
          },
          onError: (DioError error, ErrorInterceptorHandler handler) {
            return errorInterceptor(error, _dio!, handler);
          },
        ),
      );
    }

    return _dio!;
  }

  dynamic errorInterceptor(
      DioError error, Dio dio, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {}

    // TODO: Add 'logger' features
    return handler.next(error);
  }

  dynamic responseInterceptor(
      Response response, ResponseInterceptorHandler handler) async {
    // TODO: Add 'logger' features
    return handler.next(response);
  }

  dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: Add 'logger' features
    return handler.next(options);
  }
}
