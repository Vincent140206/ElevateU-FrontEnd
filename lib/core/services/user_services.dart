import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'local_storage_service.dart';

class UserServices {
  final localStorageService = LocalStorageService();
  final Dio dio = Dio();

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> deleteUser() async {
    try {
      final response = await dio.delete(
        ApiConstant.deleteUser
      );
      if (response.statusCode == 204) {
        debugPrint("Sukses delete user");
      }
    } catch(e){
      throw Exception("Gagal delete user $e");
    }
  }

  Future<void> getUser() async {
    try{
      final response = await dio.get(
        ApiConstant.getUser,
      );
      if(response.statusCode == 200) {
        debugPrint("Get User sukses");
      }
    } catch(e){
      throw Exception("Gagal get user");
    }
  }

  Future<void> patchUser ({
    String name = 'Default Name',
    String email = 'default@example.com',
    String universitas = 'Default University',
    String jurusan = 'Default Major',
    String specialization = 'Default specialization',
    String experience = 'Default experience',
  }) async {
    try {
      final response = await dio.patch(
        ApiConstant.patchUser ,
        data: {
          "name": name,
          "email": email,
          "student": {
            "instance": universitas,
            "major": jurusan,
          },
          "mentor": {
            "specialization": specialization,
            "experience": experience,
            "price": 0,
          },
        },
      );
      if (response.statusCode == 204) {
        debugPrint("Patch User Sukses");
      } else {
        debugPrint("Gagal memperbarui data pengguna: ${response.statusCode}");
        throw Exception("Gagal memperbarui data pengguna: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error patching user: $e");
      throw Exception("Gagal memperbarui data pengguna: $e");
    }
  }

  Future<void> updateAvatar(File imageFile) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path, filename: 'avatar.png'),
    });

    try {
      var response = await dio.post(ApiConstant.updateAvatar, data: formData);
      if (response.statusCode == 204) {
        debugPrint('Upload successful');
      } else {
        debugPrint('Upload failed');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Gagal mengupload avatar: $e');
    }
  }
}