import 'package:flutter/material.dart';

abstract class LoginRegisterState {}

class LoginRegisterInitialState extends LoginRegisterState {}

class LoginButtonNavigateState extends LoginRegisterState {}

class RegisterButtonNavigateState extends LoginRegisterState {}

class LoginWithDataButtonNavigateState extends LoginRegisterState {}

class LoginRegisterWithDataButtonErrorState extends LoginRegisterState {
  final String error;
  LoginRegisterWithDataButtonErrorState({required this.error});
}

class LogoutButtonNavigateState extends LoginRegisterState {}

class NavigateToNotificationPageState extends LoginRegisterState {}

class NavigateToMyOrdersPageState extends LoginRegisterState {}

class AddressShowBottomSheetState extends LoginRegisterState {
  final TextEditingController addressTextEditingController;

  AddressShowBottomSheetState({required this.addressTextEditingController});
}

class AddressSaveAddressButtonState extends LoginRegisterState {}
