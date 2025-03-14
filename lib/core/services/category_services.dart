import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/core/services/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryServices {
  final LocalStorageService localStorageService = LocalStorageService();
  final Dio dio = Dio();

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<void> createCategory(String name) async {
    try{
      final response = await dio.post(
        ApiConstant.newCategory,
        data: {
          "name": name
        }
      );

      if(response.statusCode == 201) {
        debugPrint("Category Baru dibuat");
      } else {
        debugPrint("Gagal membuat kategori: ${response.statusCode}");
        throw Exception("Gagal membuat: ${response.statusCode}");
      }
    } catch(e) {
      debugPrint("Error create category: $e");
      throw Exception("Gagal membuat: $e");
    }
  }

  Future<void> getCategory() async {
    try {
      final response = await dio.get(ApiConstant.getCategory);

      if (response.statusCode == 200) {
        List<dynamic> categories = response.data['categories'];

        if (categories.isNotEmpty) {
          String id = categories[0]['id'];
          String name = categories[0]['name'];

          debugPrint(id);
          debugPrint(name);

          await localStorageService.saveCategory(id, name);
          debugPrint("Category berhasil di get dan disimpan: id = $id, name = $name");
        } else {
          debugPrint("No categories found");
        }
      } else {
        debugPrint("Gagal mengambil category: ${response.statusCode}");
        throw Exception("Gagal mengambil: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error get category: $e");
      throw Exception("Gagal mengambil: $e");
    }
  }

  Future<void> updateCategory(String id, String name) async {
    final String url = 'https://elevateu.nathakusuma.com/api/v1/categories/$id';
    try {
      final response = await dio.put(
          url,
        data: {
            "name": name
        }
      );

      if (response.statusCode == 204) {
        debugPrint("Category updated successfully: ${response.data}");
      } else {
        debugPrint("Failed to update category: ${response.statusCode}");
        throw Exception("Failed to update: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error updating category: $e");
      throw Exception("Failed to update: $e");
    }
  }

  Future<void> deleteCategory(String id) async {
    final String url = 'https://elevateu.nathakusuma.com/api/v1/categories/$id';
    try{
      final response = await dio.delete(url);

      if (response.statusCode == 204) {
        debugPrint("Category deleted successfully: ${response.data}");
      } else {
        debugPrint("Failed to delete category: ${response.statusCode}");
        throw Exception("Failed to delete: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error deleting category: $e");
      throw Exception("Failed to delete: $e");
    }
  }

}