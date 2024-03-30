part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
 
  @override
  List<Object?> get props => [message];
}

final class LoggedIn extends AuthState {
  final TokenModel token;

  LoggedIn(this.token);
 
  @override
  List<Object?> get props => [token];
}
final class LoggedOut extends AuthState {}

