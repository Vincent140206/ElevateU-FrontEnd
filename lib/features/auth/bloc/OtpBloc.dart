import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RegisterEvent.dart';

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
        String? phone = prefs.getString('phone');
        String? keahlian = prefs.getString('keahlian');
        String? posisi = prefs.getString('posisi');
        String? perusahaan = prefs.getString('perusahaan');

        debugPrint('Email: $email');
        debugPrint('OTP: $otp');
        debugPrint('Name: $name');
        debugPrint('Password: $password');
        debugPrint('Role: $role');
        debugPrint('University: $university');
        debugPrint('Major: $jurusan');
        debugPrint('Phone: $phone');
        debugPrint('keahlian: $keahlian');
        debugPrint('posisi: $posisi');

        final response = await dio.post(
            ApiConstant.register,
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
                "specialization": keahlian,
                "experience": posisi,
                "price": 0
              }
            }
        );

        if (response.statusCode == 201) {
          debugPrint('SUKSESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
          emit(OtpSuccess());
        } else if (response.statusCode == 422) {
          String errorMessage = response.data['message'] ?? 'Unknown error occurred';
          emit(OtpFailure('Error 422: $errorMessage'));
        } else {
          emit(OtpFailure('Failed to validate OTP: ${response.data}'));
        }
      } catch (e) {
        debugPrint('GAGALLLLLLLLLLLLLLLLLLLLLLLL');
        debugPrint(e.toString());
        emit(OtpFailure('Error: ${e.toString()}'));

        if (e is DioException) {
          String errorMessage = e.response?.data['message'] ?? 'Unknown error occurred';
          emit(OtpFailure('Dio error: $errorMessage'));
        } else {
          emit(OtpFailure('Error: ${e.toString()}'));
        }
      }
      });
  }
}