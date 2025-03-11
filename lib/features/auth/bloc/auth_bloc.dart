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
        dio.options.headers['Authorization'] = 'Bearer $token';

        final response = await dio.post(
          ApiConstant.logout,
        );

        if(response.statusCode == 201) {
          emit(AuthSuccess());
          debugPrint("Berhasil");
        }
      } catch (e) {
        emit(AuthFailure('error'));
        throw Exception("Error: $e");
      }
    });
  }
}