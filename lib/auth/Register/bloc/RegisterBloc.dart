import 'package:dio/dio.dart';
import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AuthEvent.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Dio dio;

  RegisterBloc(this.dio) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      try {
        final response = await dio.post(
            ApiConstant.otp,
            data: {
              "email": event.email,
            });

        if (response.statusCode == 204) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('name', event.name);
          await prefs.setString('email', event.email);
          await prefs.setString('password', event.password);
          await prefs.setString('role', event.role);
          debugPrint('Sukses');
          emit(RegisterSuccess());
        } else if (response.statusCode == 400) {
          debugPrint('Udah ada');
          emit(RegisterFailure(error: 'Invalid email or user already exists'));
        } else {
          emit(RegisterFailure(error: 'Registration failed with status code: ${response.statusCode}'));
        }
      } on DioException catch (dioError) {
        emit(RegisterFailure(error: dioError.message.toString()));
      } catch (e) {
        debugPrint('Error occurred: $e');
        emit(RegisterFailure(error: 'An unexpected error occurred: ${e.toString()}'));
      }
    });
  }
}