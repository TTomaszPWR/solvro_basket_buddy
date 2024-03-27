part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
 
  @override
  List<Object?> get props => [message];
}

final class LoggedState extends AuthState {
  final TokenModel token;

  LoggedState(this.token);
 
  @override
  List<Object?> get props => [token];

  @override
  String toString() {
    return super.toString();
  }

}
final class LoggedOutState extends AuthState {}

