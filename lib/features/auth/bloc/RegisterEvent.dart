//Register
abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String email;

  RegisterSubmitted({
    required this.email,
  });
}

abstract class RegisterState{}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({
    required this.error,
});
}


//OTP
abstract class OtpEvent {}

class OTPSubmitted extends OtpEvent {
  final String otp;

  OTPSubmitted(this.otp);
}

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpFailure extends OtpState {
  final String error;

  OtpFailure(this.error);
}