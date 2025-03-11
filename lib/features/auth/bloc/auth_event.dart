abstract class AuthEvent {}

class ResetPasswordOtpSubmitted extends AuthEvent {
  final String email;

  ResetPasswordOtpSubmitted({
    required this.email
  });
}

class ResetPasswordSubmitted extends AuthEvent {
  final String email;
  final String otp;
  final String newPassword;

  ResetPasswordSubmitted({
    required this.email,
    required this.otp,
    required this.newPassword
  });
}

class LogoutSubmitted extends AuthEvent {}