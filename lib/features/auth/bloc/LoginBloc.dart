import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/local_storage_service.dart';
import 'LoginEvent.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio;

  LoginBloc(this.dio) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final response = await dio.post(
          ApiConstant.login,
          data: {
            "email": event.email,
            "password": event.password,
          },
        );

        if (response.statusCode == 200) {
          debugPrint('Login Sukses');
          
          final data = response.data;
          final accessToken = data['access_token'];
          final refreshToken = data['refresh_token'];
          final user = data['user'];
          
          final localStorageService = LocalStorageService();
          await localStorageService.saveToken(accessToken, refreshToken);
          await localStorageService.saveUserDataLoggedIn(
            user['id'],
            user['name'],
            user['email'],
            user['role'],
            user['avatar_url'],
            user['student']['instance'],
            user['student']['major'],
            user['mentor']['specializausertion'],
            user['mentor']['experience'],
            user['mentor']['rating'],
            user['mentor']['rating_count'],
            user['mentor']['price'],
          );

          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: 'Login gagal, silakan coba lagi.'));
        }
      } catch (e) {
        emit(LoginFailure(error: 'Terjadi kesalahan, silakan coba lagi.'));
      }
    });
  }
}