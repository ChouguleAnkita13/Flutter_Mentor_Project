import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_data.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterInitialState()) {
    on<LoginButtonNavigateEvent>(loginButtonNavigateEvent);
    on<RegisterButtonNavigateEvent>(registerButtonNavigateEvent);
    on<LoginWithDataButtonNavigateEvent>(loginWithDataButtonNavigateEvent);
    on<RegisterWithDataButtonNavigateEvent>(
        registerWithDataButtonNavigateEvent);
    on<LogoutButtonNavigateEvent>(logoutButtonNavigateEvent);
    on<NotificationButtonNavigateEvent>(notificationButtonNavigateEvent);
    on<MyOrdersButtonNavigateEvent>(myOrdersButtonNavigateEvent);
    on<AddressShowBottomSheetEvent>(addressShowBottomSheetEvent);
    on<AddressSaveAddressButtonEvent>(addressSaveAddressButtonEvent);
    on<UpdateUsernameOnFieldSubmittedEvent>(
        updateUsernameOnFieldSubmittedEvent);
    on<OnPasswordVisibilityEvent>(onPasswordVisibilityEvent);
  }
  final TextEditingController addressTextEditingController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController =
      TextEditingController(text: SessionData.username);

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
    String res = await FirebaseData.signUserAccount(event.userCredential);
    if (res == "true") {
      emit(LoginWithDataButtonNavigateState());
    } else {
      emit(LoginRegisterWithDataButtonErrorState(error: res));
    }
  }

  FutureOr<void> registerWithDataButtonNavigateEvent(
      RegisterWithDataButtonNavigateEvent event,
      Emitter<LoginRegisterState> emit) async {
    String res = await FirebaseData.createUserAccount(event.userCredential);
    if (res == "true") {
      emit(LoginButtonNavigateState());
    } else {
      emit(LoginRegisterWithDataButtonErrorState(error: res));
    }
  }

  FutureOr<void> logoutButtonNavigateEvent(
      LogoutButtonNavigateEvent event, Emitter<LoginRegisterState> emit) async {
    await FirebaseData.logoutFromFirebase();
    emit(LogoutButtonNavigateState());
  }

  FutureOr<void> notificationButtonNavigateEvent(
      NotificationButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(NavigateToNotificationPageState());
  }

  FutureOr<void> myOrdersButtonNavigateEvent(
      MyOrdersButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(NavigateToMyOrdersPageState());
  }

  FutureOr<void> addressShowBottomSheetEvent(AddressShowBottomSheetEvent event,
      Emitter<LoginRegisterState> emit) async {
    await SessionData.getSessionAddress();
    addressTextEditingController.text = SessionData.address!;
    emit(AddressShowBottomSheetState());
  }

  FutureOr<void> addressSaveAddressButtonEvent(
      AddressSaveAddressButtonEvent event,
      Emitter<LoginRegisterState> emit) async {
    if (SessionData.address != event.deliveryAddress) {
      await FirebaseData.updateAddressFromFirebase(event.deliveryAddress);
    }
    emit(AddressSaveAddressButtonState());
  }

  FutureOr<void> updateUsernameOnFieldSubmittedEvent(
      UpdateUsernameOnFieldSubmittedEvent event,
      Emitter<LoginRegisterState> emit) async {
    if (SessionData.username != event.username) {
      log("Username Updated");
      SessionData.username = event.username;
      await FirebaseData.updateUsernameFromFirebase(event.username);
    }
  }

  FutureOr<void> onPasswordVisibilityEvent(
      OnPasswordVisibilityEvent event, Emitter<LoginRegisterState> emit) {}
}
