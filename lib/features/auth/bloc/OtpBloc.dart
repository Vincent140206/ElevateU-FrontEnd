import 'package:elevateu_bcc_new/core/constant/api_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        String email = prefs.getString('email') ?? ' ';
        String otp = prefs.getString('otp') ?? ' ';
        String name = prefs.getString('name') ?? ' ';
        String password = prefs.getString('password') ?? ' ';
        String role = prefs.getString('role') ?? 'user';
        String address = prefs.getString('addres') ?? ' ';
        String university = prefs.getString('university') ?? ' ';
        String jurusan = prefs.getString('jurusan') ?? ' ';
        String phone = prefs.getString('phone') ?? ' ';
        String keahlian = prefs.getString('keahlian') ?? ' ';
        String posisi = prefs.getString('posisi') ?? ' ';
        String perusahaan = prefs.getString('perusahaan') ?? ' ';
        int price = 0;

        email = event.email ?? email;
        name = event.name ?? name;
        password = event.password ?? password;
        role = event.role ?? role;
        address = event.address ?? address;
        university = event.university ?? university;
        jurusan = event.jurusan ?? jurusan;
        phone = event.phone ?? phone;
        keahlian = event.keahlian ?? keahlian;
        posisi = event.posisi ?? posisi;
        perusahaan = event.perusahaan ?? perusahaan;

        debugPrint(email);
        debugPrint(otp);
        debugPrint(name);
        debugPrint(password);
        debugPrint(role);
        debugPrint(university);
        debugPrint(jurusan);
        debugPrint(keahlian);
        debugPrint(posisi);

        if (role != 'student' && role != 'mentor') {
          role = 'student';
        }

        if (price <= 0) {
          price = 100;
        }

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
                "price": price
              }
            }
        );

        if (response.statusCode == 201) {
          debugPrint("SUKSESSSSSSSSSSSS");
          emit(OtpSuccess());
        } else if (response.statusCode == 422) {
          debugPrint('Response data: ${response.data}');
          emit(OtpFailure('Validation errors: ${response.data}'));
        } else {
          emit(OtpFailure('Failed to validate OTP: ${response.data}'));
        }
      } catch (e) {
        debugPrint('GAGALLLLLLLLLLLLLLLLLLLLLLLL');
        debugPrint(e.toString());

        if (e is DioException) {
          if (e.response != null) {
            debugPrint('Dio error response data: ${e.response?.data}');
            emit(OtpFailure('Dio error: ${e.response?.data}'));
          } else {
            emit(OtpFailure('Dio error: ${e.toString()}'));
          }
        } else {
          emit(OtpFailure('Error: ${e.toString()}'));
        }
      }
    });
  }
}