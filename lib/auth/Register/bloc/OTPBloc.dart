import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AuthEvent.dart';

class OTPBloc extends Bloc<OtpEvent, OtpState> {
  final Dio dio;

  OTPBloc(this.dio) : super(OtpInitial()) {
    on<OTPSubmitted>((event, emit) async {
      emit(OtpLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String? email = prefs.getString('email');
        String? otp = prefs.getString('otp');
        String? name = prefs.getString('name');
        String? password = prefs.getString('password');
        String? role = prefs.getString('role');
        String? address = prefs.getString('addres');
        String? university = prefs.getString('university');
        String? jurusan = prefs.getString('jurusan');

        debugPrint('Email: $email');
        debugPrint('OTP: $otp');
        debugPrint('Name: $name');
        debugPrint('Password: $password');
        debugPrint('Role: $role');
        debugPrint('University: $university');
        debugPrint('Major: $jurusan');

        final response = await dio.post(
          'https://elevateu.nathakusuma.com/api/v1/auth/register',
          data: {
            "email": email,
            "otp": otp,
            "name": name,
            "password": password,
            "role": role,
            "student": {
              "instance": university,
              "major": jurusan,
            },
            "mentor": {
              "specialization": '',
              "experience": '',
              "price": ''
            }
          }
        );

        if (response.statusCode == 201) {
          debugPrint('SUKSESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
          emit(OtpSuccess());
        } else {
          emit(OtpFailure('Failed to validate OTP: ${response.data}'));
        }
      } catch (e) {
        debugPrint('GAGALLLLLLLLLLLLLLLLLLLLLLLL');
        debugPrint('${e.toString()}');
        emit(OtpFailure('Error: ${e.toString()}'));
      }
    });
  }
}