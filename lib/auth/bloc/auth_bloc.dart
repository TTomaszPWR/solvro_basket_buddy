import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/auth/repo/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(LoggedOut()){
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await _userRepository.login(event.email, event.password);
        emit(LoggedIn(token));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
      print(state.toString());
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        var token = await _userRepository.register(event.email, event.password);
        emit(LoggedIn(token));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
      print(state.toString());
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _userRepository.logout(event.token);
        emit(LoggedOut());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
      print(state.toString());
    });
  }
}
