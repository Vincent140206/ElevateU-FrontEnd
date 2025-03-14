  import 'package:dio/dio.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
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
            final localStorageService = LocalStorageService();
            debugPrint('Login Sukses');

            final data = response.data;
            final accessToken = data['access_token'];
            final refreshToken = data['refresh_token'];
            final user = data['user'];

            // if (user != null) {
            //   final student = user['student'];
            //   if (student != null) {
            //     await localStorageService.saveUserDataLoggedIn(
            //       user['id'],
            //       user['name'],
            //       user['email'],
            //       user['role'],
            //       user['avatar_url'],
            //       student['instance'],
            //       student['major'],
            //     );
            //   } else {
            //     debugPrint('Student data is null');
            //     emit(LoginFailure(error: 'Data siswa tidak ditemukan.'));
            //     return;
            //   }
            // } else {
            //   debugPrint('User  data is null');
            //   emit(LoginFailure(error: 'Data pengguna tidak ditemukan.'));
            //   return;
            // }

            await localStorageService.saveBearerToken(accessToken);
            debugPrint(accessToken);
            await localStorageService.saveToken(accessToken, refreshToken);
            debugPrint('Simpan data sukses!');
            emit(LoginSuccess());
          } else if (response.statusCode == 401) {
            emit(LoginFailure(error: 'Login gagal, silakan coba lagi.'));
          } else {
            emit(LoginFailure(error: 'Login gagal dengan status: ${response.statusCode}'));
          }
        } catch (e) {
          debugPrint('Error: ${e.toString()}');

          String errorMessage;
          if (e is DioException) {
            if (e.response != null) {
              debugPrint('Dio error response data: ${e.response?.data}');
              errorMessage = 'Dio error: ${e.response?.data}';
            } else {
              errorMessage = 'Dio error: ${e.message}';
            }
          } else {
            errorMessage = 'Terjadi kesalahan, ${e.toString()} silakan coba lagi.';
          }
          emit(LoginFailure(error: errorMessage));
        }
      });
    }
  }