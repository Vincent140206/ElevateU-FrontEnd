import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Event.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Dio dio;

  RegisterBloc(this.dio) : super(RegisterInitial()) {
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      try {
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
        } else {
          emit(RegisterFailure(error: 'Registration failed'));
        }
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}

