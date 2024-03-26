part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class LoginState extends AuthState {}
