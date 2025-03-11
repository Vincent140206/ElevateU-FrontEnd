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
  final String? email;
  final String? otp;
  final String? name;
  final String? password;
  final String? role;
  final String? address;
  final String? university;
  final String? jurusan;
  final String? phone;
  final String? keahlian;
  final String? posisi;
  final String? perusahaan;

  OTPSubmitted({
    this.email,
    this.otp,
    this.name,
    this.password,
    this.role,
    this.address,
    this.university,
    this.jurusan,
    this.phone,
    this.keahlian,
    this.posisi,
    this.perusahaan,
  });
}

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {}

class OtpFailure extends OtpState {
  final String error;

  OtpFailure(this.error);
}