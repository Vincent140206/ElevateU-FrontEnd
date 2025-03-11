import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/features/auth/bloc/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/local_storage_service.dart';
import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio dio;
  final LocalStorageService localStorageService;

  AuthBloc(this.dio, this.localStorageService) : super(AuthInitiate()) {
    on<LogoutSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        String token = await localStorageService.getBearerToken();
        debugPrint('Bearer Token: $token');
        dio.options.headers['Authorization'] = 'Bearer $token';

        final response = await dio.post(
          ApiConstant.logout,
            options: Options(
            headers: {
              'Authorization': "Bearer $token",
            }
        )
        );

        if (response.statusCode == 204) {
          await localStorageService.clearToken();
          emit(AuthSuccess());
          debugPrint("Logout berhasil");
        } else {
          emit(AuthFailure('Logout gagal: ${response.data}'));
        }
      } catch (e) {
        emit(AuthFailure('Terjadi kesalahan saat logout'));

        if (e is DioException) {
          if (e.response != null) {
            debugPrint('Dio error response data: ${e.response?.data}');
            emit(AuthFailure('Dio error: ${e.response?.data}'));
          } else {
            emit(AuthFailure('Dio error: ${e.toString()}'));
          }
        } else {
          emit(AuthFailure('Error: ${e.toString()}'));
        }
      }
    });
  }
}