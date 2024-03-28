import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solvro_basket_buddy/auth/model/token_model.dart';
import 'package:solvro_basket_buddy/auth/repo/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(LoggedOutState()){
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final token = await _userRepository.login(event.email, event.password);
        emit(LoggedState(token));
        
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
      print(state.toString());
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        var token = await _userRepository.register(event.email, event.password);
        emit(LoggedState(token));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
      print(state.toString());
    });

    on<AuthLogoutEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _userRepository.logout(event.token);
        emit(LoggedOutState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
      print(state.toString());
    });
  }
}
