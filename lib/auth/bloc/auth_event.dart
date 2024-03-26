part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
}


class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegisterEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthLogoutEvent extends AuthEvent {}