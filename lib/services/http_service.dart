import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:wine_explorer/constants/url_constants.dart';
import 'dart:developer' as developer;

class HttpService {
  late Dio _dio;

  HttpService(Dio dio) {
    _dio = Dio(
      BaseOptions(
        baseUrl: kApiUrl,
      ),
    );
    initializeInterceptors();
  }

  Future<Response> getRequest(
      String endPoint, Map<String, dynamic>? queryParameters) async {
    Response response;

    debugPrint("\x1B[33mGET queryParameters\x1B[0m");
    debugPrint("\x1B[32m" + queryParameters.toString() + "\x1B[0m");

    try {
      response = await _dio.get(
        kApiUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
        ),
      );
    } on DioError catch (e) {
      debugPrint(e.error);
      debugPrint(e.response.toString());
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        return handler.next(request);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        if (kDebugMode) {
          print("${error.message}");
        }
        return handler.next(error);
      },
    ));
  }
}
