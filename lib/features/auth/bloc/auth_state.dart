abstract class AuthState {}

class AuthInitiate extends AuthState{}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{}

class AuthFailure extends AuthState{
  final String error;

  AuthFailure(this.error);
}