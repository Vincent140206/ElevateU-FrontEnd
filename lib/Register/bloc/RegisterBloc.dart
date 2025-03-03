import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Dio dio;

  RegisterBloc(this.dio) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      try {
        if (event.email.isEmpty || event.name.isEmpty || event.password.isEmpty) {
          emit(RegisterFailure(error: 'All fields are required'));
          return;
        }

        final response = await dio.post('https://elevateu.nathakusuma.com/api/v1/auth/register/otp', data: {
          "email": event.email,
        });

        if (response.statusCode == 204) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('name', event.name);
          await prefs.setString('email', event.email);
          await prefs.setString('password', event.password);
          await prefs.setString('role', event.role);
          emit(RegisterSuccess());
        } else if (response.statusCode == 400) {
          emit(RegisterFailure(error: 'Invalid email or user already exists'));
        } else {
          emit(RegisterFailure(error: 'Registration failed with status code: ${response.statusCode}'));
        }
      } on DioException catch (dioError) {
        emit(RegisterFailure(error: dioError.message.toString()));
      } catch (e) {
        emit(RegisterFailure(error: 'An unexpected error occurred: ${e.toString()}'));
      }
    });
  }
}