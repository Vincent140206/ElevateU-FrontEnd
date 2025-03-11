import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:elevateu_bcc_new/features/auth/view/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/PopUp.dart';
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
                "price": 00000
              }
            }
        );

        if (response.statusCode == 201) {
          debugPrint('SUKSESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
          emit(OtpSuccess());
        } else if (response.statusCode == 422) {
          List<String> errorMessages = [];
          if (response.data['validation_errors'] != null) {
            for (var error in response.data['validation_errors']) {
              error.forEach((key, value) {
                errorMessages.add(
                    value['translation'] ?? 'Unknown error for $key');
              });
            }
          }
          emit(OtpFailure('Validation errors: ${errorMessages.join(', ')}'));
        } else {
          emit(OtpFailure('Failed to validate OTP: ${response.data}'));
        }
      } catch (e) {
        debugPrint('GAGALLLLLLLLLLLLLLLLLLLLLLLL');
        debugPrint(e.toString());
        emit(OtpFailure('Error: ${e.toString()}'));

        if (e is DioException) {
          String errorMessage = e.response?.data['message'] ??
              'Unknown error occurred';
          emit(OtpFailure('Dio error: $errorMessage'));
        } else {
          emit(OtpFailure('Error: ${e.toString()}'));
        }
      }
    });
  }
}