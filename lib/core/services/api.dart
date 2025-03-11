import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  late SharedPreferences prefs;

  Api._();

  static Future<Api> create() async {
    final api = Api._();
    api.prefs = await SharedPreferences.getInstance();
    api._init();
    return api;
  }

  void _init() {
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        if ((error.response?.statusCode == 401 &&
            error.response?.data['message'] == "Auth session is invalid. Please login again.")) {
          if (await prefs.containsKey('refreshKey')) {
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
    final response = await api.post(
      ApiConstant.refresh,
      data: {
        'refresh_token': refreshToken,
      },
    );

    try {
      if (response.statusCode == 201) {
        accessToken = response.data;
      } else {
        accessToken = null;
      }
    } catch (e) {
      throw Exception('error');
    }
  }
}