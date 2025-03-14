import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/core/services/category_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/local_storage_service.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final LocalStorageService localStorageService = LocalStorageService();
  final CategoryServices categoryServices;
  final Dio dio;

  void setBearerToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  CategoryBloc(this.dio, this.categoryServices,) : super(CategoryInitial()) {

    on<CreateCategoryRequested>((event, state) async {
      debugPrint('Create Category Requested event received');
      emit(CategoryLoading());
      try{
        String token = await localStorageService.getBearerToken();
        categoryServices.setBearerToken(token);
        await categoryServices.createCategory(event.name);
        emit(CategorySuccess());
      } catch (e) {
        emit(CategoryFailure(e.toString()));
      }
    });

    on<GetCategoryRequested>((event, state) async {
      debugPrint('Get Category Requested event received');
      emit(CategoryLoading());
      try{
        String token = await localStorageService.getBearerToken();
        categoryServices.setBearerToken(token);
        await categoryServices.getCategory();
        emit(CategorySuccess());
      } catch(e){
        emit(CategoryFailure(e.toString()));
      }
    });

    on<UpdateCategoryRequested>((event, state) async {
      debugPrint('Update Category Requested event received');
      emit(CategoryLoading());
      try {
        String token = await localStorageService.getBearerToken();
        categoryServices.setBearerToken(token);
        await categoryServices.updateCategory(event.id, event.name);
        emit(CategorySuccess());
      } catch (e) {
        debugPrint("Error updating category: $e");
        emit(CategoryFailure(e.toString()));
      }
    });

    on<DeleteCategoryRequested>((event, state) async {
      debugPrint('Delete Category Requested event received');
      emit(CategoryLoading());
      try{
        String token = await localStorageService.getBearerToken();
        categoryServices.setBearerToken(token);
        await categoryServices.deleteCategory(event.id);
        emit(CategorySuccess());
      } catch(e) {
        debugPrint("Error deleting category: $e");
        emit(CategoryFailure(e.toString()));
      }
    });

    
  }
}