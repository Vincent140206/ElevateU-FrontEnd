import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Event.dart';

class OTPBloc extends Bloc<OtpEvent, OtpState> {
  final Dio dio;

  OTPBloc(this.dio) : super(OtpInitial()) {
    on<OTPSubmitted>((event, emit) async {
      emit(OtpLoading());
      try {
        final prefs = await SharedPreferences.getInstance();
        String name = prefs.getString('name') ?? '';
        String email = prefs.getString('email') ?? '';
        String password = prefs.getString('password') ?? '';

        final response = await dio.post(
          'https://elevateu.nathakusuma.com/api/v1/auth/validate-otp',
          data: {
            "otp": event.otp,
            "name": name,
            "email": email,
            "password": password,
          },
        );

        if (response.statusCode == 200) {
          emit(OtpSuccess());
        } else {
          emit(OtpFailure('Failed to validate OTP: ${response.data}'));
        }
      } catch (e) {
        emit(OtpFailure('Error: ${e.toString()}'));
      }
    });
  }
}