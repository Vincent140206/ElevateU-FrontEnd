abstract class AuthEvent {}

class ResetPasswordOtpSubmitted extends AuthEvent {
  final String email;

  ResetPasswordOtpSubmitted({
    required this.email
  });
}