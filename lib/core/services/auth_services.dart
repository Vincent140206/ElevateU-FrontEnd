import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'local_storage_service.dart';

class AuthServices {
  final localStorageService = LocalStorageService();
  final Dio dio = Dio();

  // reset password
  Future<void> resetPasswordOtp (String email) async {
    try {
      final response = await dio.post(
        ApiConstant.resetPasswordOtp,
        data: {
          "email": email,
        }
      );
    } catch(e) {

    }
  }

  // refresh token
  Future<void> refreshToken (String refreshToken) async {
    try {
      final refreshToken = await localStorageService.getRefreshToken();
      final response = await dio.post(
        ApiConstant.refresh,
          data: {
          "refresh_token": refreshToken
        }
      );

      if (response.statusCode == 200) {
        debugPrint('refresh tokenn sukses');

        final data = response.data;
        final accessToken = data['access_token'];
        final refreshToken = data['refresh_token'];
        await localStorageService.saveToken(accessToken, refreshToken);
      }
    } catch(e) {
      throw Exception("Gagal Refresh token: $e");
    }
  }

  // logout
  Future<void> logout() async{
    try {
      final response = await dio.post(
        ApiConstant.logout,
      );

      if (response.statusCode == 204) {
        debugPrint("Sukses Logout");
      }
    } catch(e) {
      throw Exception("Gagal Logout: $e");
    }
  }
}