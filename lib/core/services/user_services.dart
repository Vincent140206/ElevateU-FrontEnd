import 'dart:io';
import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'local_storage_service.dart';
import 'package:image_picker/image_picker.dart';

class UserServices {
  final localStorageService = LocalStorageService();
  final Dio dio = Dio();

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> deleteUser() async {
    try {
      final response = await dio.delete(ApiConstant.deleteUser);
      if (response.statusCode == 204) {
        debugPrint("Sukses delete user");
      }
    } catch (e) {
      throw Exception("Gagal delete user: $e");
    }
  }

  Future<void> getUser() async {
    try {
      final response = await dio.get(ApiConstant.getUser );
      if (response.statusCode == 200) {
        debugPrint("Get User sukses");
      }
    } catch (e) {
      throw Exception("Gagal get user: $e");
    }
  }

  Future<void> patchUser (String name, String email, String universitas, String jurusan, String specialization) async {
    debugPrint("patchUser  method called");
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
            "experience": 'Default experience',
            "address": "123 Main Street, Jakarta",
            "current_job": "Senior Developer",
            "company": "Gojek",
            "bio": "Experienced backend developer with 5+ years in the industry",
            "gender": "male"
          },
        },
      );

      if (response.statusCode == 204 || response.statusCode == 200) {
        debugPrint("Patch User Sukses");
        debugPrint("Updated User Data:");
        debugPrint("Name: $name");
        debugPrint("Email: $email");
        debugPrint("University: $universitas");
        debugPrint("Major: $jurusan");
        debugPrint("Specialization: $specialization");
        debugPrint("Address: 123 Main Street, Jakarta");
        debugPrint("Current Job: Senior Developer");
        debugPrint("Company: Gojek");
        debugPrint("Bio: Experienced backend developer with 5+ years in the industry");
        debugPrint("Gender: male");
      } else {
        debugPrint("Gagal memperbarui data pengguna: ${response.statusCode}");
        throw Exception("Gagal memperbarui data pengguna: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error patching user: $e");
      throw Exception("Gagal memperbarui data pengguna: $e");
    }
  }

  Future<String> updateAvatar(File imageFile) async {
    String fileExtension = path.extension(imageFile.path);
    String fileName = 'avatar$fileExtension';
    FormData formData = FormData.fromMap({
      'avatar': await MultipartFile.fromFile(imageFile.path, filename: fileName),
    });

    try {
      var response = await dio.put(ApiConstant.updateAvatar, data: formData);
      debugPrint('Response data: ${response.statusCode}');
      if (response.statusCode == 204) {
        debugPrint('Upload successful');
        if (response.data is Map<String, dynamic> && response.data.containsKey('url')) {
          String imageUrl = response.data['url'];
          return imageUrl;
        } else {
          throw Exception('Invalid response format');
        }
      } if(response.statusCode == 413){
        ScaffoldMessenger.of(path.context as BuildContext).showSnackBar(
          SnackBar(
            content: Text('File too large. Please select a smaller image.'),
            backgroundColor: Colors.black12,
          ),
        );
        throw Exception('File too large');
      } else{
        debugPrint('Upload failed with status code: ${response.statusCode}');
        throw Exception('Upload failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Gagal mengupload avatar: $e');
    }
  }

  Future<void> deleteAvatar() async {
    try {
      debugPrint('Attempting to delete avatar at: ${ApiConstant.deleteAvatar}');
      final response = await dio.delete(ApiConstant.deleteAvatar);
      if (response.statusCode == 204) {
        debugPrint("Delete Avatar Berhasil");
      } else {
        debugPrint(" Gagal hapus avatar: ${response.statusCode}");
        throw Exception("Gagal hapus avatar pengguna: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Gagal menghapus avatar: $e');
    }
  }

  Future<void> pickImageAndUpdateAvatar(BuildContext context, Function(String) onSuccess, Function(String) onFailure) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      debugPrint('Picked image: ${pickedFile.path}');

      try {
        String token = await localStorageService.getBearerToken();
        setBearerToken(token);
        String imageUrl = await updateAvatar(image);
        onSuccess(imageUrl);
      } catch (e) {
        onFailure('Error: ${e.toString()}');
      }
    } else {
      onFailure('No image selected.');
    }
  }
}