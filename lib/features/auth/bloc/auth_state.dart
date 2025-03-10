abstract class AuthState {}

class LogoutInitiate extends AuthState{}

class LogoutLoading extends AuthState{}

class LogoutSuccess extends AuthState{}

class LogoutFailure extends AuthState{
  final String error;

  LogoutFailure(this.error);
}