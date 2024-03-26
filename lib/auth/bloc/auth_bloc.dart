import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:solvro_basket_buddy/auth/model/token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(AuthEvent event, Emitter<AuthState> emit) async {
    if(event is AuthLoginEvent){
      
    }
  }
}
