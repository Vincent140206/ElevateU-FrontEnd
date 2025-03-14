import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  late SharedPreferences prefs;

  Api._();

  static Future<Api> create() async {
    final api = Api._();
    api.prefs = await SharedPreferences.getInstance();
    api.accessToken = api.prefs.getString('accessToken');
    api._init();
    return api;
  }

  void _init() {
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = 'Bearer $accessToken';
        debugPrint('Request: ${options.method} ${options.path} with headers: ${options.headers}');
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        debugPrint('Error: ${error.response?.statusCode} ${error.response?.data}');
        if (error.response?.statusCode == 401 &&
            error.response?.data['message'] == "Auth session is invalid. Please login again.") {
          if (await prefs.containsKey('refreshToken')) {
            await refreshToken();
            return handler.resolve(await retry(error.requestOptions));
          }
        }
        return handler.next(error);
      },
    ));
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> refreshToken() async {
    final refreshToken = await prefs.getString('refreshToken');
    debugPrint('Refreshing token with refresh token: $refreshToken');
    final response = await api.post(
      ApiConstant.refresh,
      data: {
        'refresh_token': refreshToken,
      },
    );

    try {
      if (response.statusCode == 201) {
        accessToken = response.data['access_token'];
        await prefs.setString('accessToken', accessToken!);
        debugPrint('New access token: $accessToken');
      } else {
        accessToken = null;
        debugPrint('Failed to refresh token: ${response.data}');
      }
    } catch (e) {
      debugPrint('Error refreshing token: $e');
      throw Exception('Error refreshing token');
    }
  }
}