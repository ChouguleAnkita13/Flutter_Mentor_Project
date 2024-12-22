import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_data.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterInitialState()) {
    on<LoginButtonNavigateEvent>(loginButtonNavigateEvent);
    on<RegisterButtonNavigateEvent>(registerButtonNavigateEvent);
    on<LoginWithDataButtonNavigateEvent>(loginWithDataButtonNavigateEvent);
    on<RegisterWithDataButtonNavigateEvent>(
        registerWithDataButtonNavigateEvent);
  }

  FutureOr<void> loginButtonNavigateEvent(
      LoginButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(LoginButtonNavigateState());
  }

  FutureOr<void> registerButtonNavigateEvent(
      RegisterButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(RegisterButtonNavigateState());
  }

  FutureOr<void> loginWithDataButtonNavigateEvent(
      LoginWithDataButtonNavigateEvent event,
      Emitter<LoginRegisterState> emit) async {
    await FirebaseData.signUserAccount(event.userCredential);
    emit(LoginWithDataButtonNavigateState());
  }

  FutureOr<void> registerWithDataButtonNavigateEvent(
      RegisterWithDataButtonNavigateEvent event,
      Emitter<LoginRegisterState> emit) async {
    await FirebaseData.createUserAccount(event.userCredential);
    emit(LoginButtonNavigateState());
  }
}
