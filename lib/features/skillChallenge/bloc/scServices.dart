import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;

import '../../../core/constant/api_constant.dart';
import '../../../core/services/local_storage_service.dart';

class SCServices {
  final localStorageService = LocalStorageService();
  final Dio dio = Dio();

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> createSC({
    required String groupId,
    required String title,
    required String subtitle,
    required String description,
    required String difficulty,
    required bool isFree,
  }) async {
    try {
      final response = await dio.post(
        ApiConstant.createSC,
        data: {
          "group_id": groupId,
          "title": title,
          "subtitle": subtitle,
          "description": description,
          "difficulty": difficulty,
          "is_free": isFree,
        },
      );

      if (response.statusCode == 201) {
        debugPrint("Sukses buat Challenge");
        return response.data;
      } else {
        debugPrint("Gagal buat Challenge: ${response.statusCode}");
        throw Exception("Gagal buat Challenge: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(groupId);
      debugPrint(title);
      debugPrint(subtitle);
      debugPrint(description);
      debugPrint(difficulty);
      debugPrint((isFree == false) ? "HALO" : "HAI");

      if (e is DioException) {
        debugPrint("DioError: ${e.message}");
        if (e.response != null) {
          debugPrint("Response data: ${e.response?.data}");
          debugPrint("Response headers: ${e.response?.headers}");
        } else {
          debugPrint("Error: $e");
        }
        throw Exception("Gagal buat Challenge Grup: $e");
      }
    }
  }

  Future<void> createSCGroup({
    required String token,
    required String category_id,
    required String title,
    required String description,
    required String thumbnailPath
  }) async {
    setBearerToken(token);
    String fileExtension = path.extension(thumbnailPath);
    String fileName = 'thumbnail$fileExtension';
    MultipartFile thumbnailFile = await MultipartFile.fromFile(
        thumbnailPath, filename: fileName);

    FormData formData = FormData.fromMap({
      'category_id': category_id,
      'title': title,
      'description': description,
      'thumbnail': thumbnailFile,
    });
    debugPrint('FormData contents:');
    for (var field in formData.fields) {
      debugPrint('Field: ${field.key}, Value: ${field.value}');
    }
    try {
      final response = await dio.post(
        ApiConstant.createSCG,
        data: formData,
      );

      if (response.statusCode == 201) {
        debugPrint("Sukses buat Challenge Group");
        return response.data;
      } else {
        debugPrint("Gagal buat Challenge Grup: ${response.statusCode}");
        throw Exception(
            "Gagal buat Challenge Grup: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
      if (e is DioException) {
        debugPrint("DioError: ${e.message}");

        debugPrint(category_id);
        debugPrint(title);
        debugPrint(description);
        debugPrint(thumbnailPath);

        if (e.response != null) {
          debugPrint("Response data: ${e.response?.data}");
          debugPrint("Response headers: ${e.response?.headers}");
        } else {
          debugPrint("Error: $e");
        }
        throw Exception("Gagal buat Challenge Grup: $e");
      }
    }

    Future<String> _convertImageToBase64(String imagePath) async {
      final bytes = await File(imagePath).readAsBytes();
      return base64Encode(bytes);
    }


    Future<void> getChallengeGroup({
      required String token,
      required String category_id,
      required String title,
      required int page,
      required int limit,
    }) async {
      setBearerToken(token);
      String url = 'https://elevateu.nathakusuma.com/api/v1/challenge-groups?category_id=$category_id&page=$page&limit=$limit';
      // try {
      //   final response = await dio.get(
      //     url,
      //     data: {
      //       "category_id":
      //     }
      //   )
      // }
    }
  }
}