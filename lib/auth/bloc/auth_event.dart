part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends AuthEvent {
  final TokenModel token;

  LogoutEvent(this.token);

  @override
  List<Object?> get props => [token];
}