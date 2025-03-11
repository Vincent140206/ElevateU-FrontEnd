import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/api_constant.dart';
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
              user['student']['major']
          );
          debugPrint('Simpan data sukses!');
          emit(LoginSuccess());
        } else if (response.statusCode == 401) {
          emit(LoginFailure(error: 'Login gagal, silakan coba lagi.'));
        }
      } catch (e) {
        debugPrint('Error : ${e.toString()}');
        emit(LoginFailure(error: 'Terjadi kesalahan, ${e.toString()} silakan coba lagi.'));
      }
    });
  }
}