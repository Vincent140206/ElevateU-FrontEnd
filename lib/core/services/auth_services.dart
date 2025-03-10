import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/view/LoginScreen.dart';
import '../../widgets/PopUp.dart';
import 'local_storage_service.dart';

class AuthServices {
  final localStorageService = LocalStorageService();
  final Dio dio = Dio();

  // reset password (otp)
  Future<void> resetPasswordOtp(BuildContext context, String email) async {
    try {
      final response = await dio.post(
        ApiConstant.resetPasswordOtp,
        data: {
          "email": email,
        },
      );
      if (response.statusCode == 204) {
        debugPrint("Otp dikirim");
        await localStorageService.saveEmail(email);
      }
    } catch (e) {
      throw Exception("Error");
    }
  }

  // Reset Password
  Future<void> resetPassword(BuildContext context, String email, String newPassword) async {
    try {
      final otp = await localStorageService.getOtp();
      final response = await dio.post(
        ApiConstant.resetPassword,
        data: {
          "email": email,
          "otp": otp,
          "new_password": newPassword,
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Ganti password berhasil');

        PopUp.show(
          context,
          imagePath: 'assets/images/AkunCreated.png',
          deskripsi: 'Password berhasil diganti!',
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // refresh token
  Future<void> refreshToken(String refreshToken) async {
    try {
      final refreshToken = await localStorageService.getRefreshToken();
      final response = await dio.post(
        ApiConstant.refresh,
        data: {
          "refresh_token": refreshToken,
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Refresh token sukses');

        final data = response.data;
        final accessToken = data['access_token'];
        final refreshToken = data['refresh_token'];
        await localStorageService.saveToken(accessToken, refreshToken);
      }
    } catch (e) {
      throw Exception("Gagal Refresh token: $e");
    }
  }

  // logout
  Future<void> logout() async {
    try {
      final response = await dio.post(
        ApiConstant.logout,
      );

      if (response.statusCode == 204) {
        debugPrint("Sukses Logout");
      }
    } catch (e) {
      throw Exception("Gagal Logout: $e");
    }
  }
}