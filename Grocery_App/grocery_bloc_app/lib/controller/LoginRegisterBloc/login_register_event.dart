abstract class LoginRegisterEvent {}

class LoginButtonNavigateEvent extends LoginRegisterEvent {}

class RegisterButtonNavigateEvent extends LoginRegisterEvent {}

class LoginWithDataButtonNavigateEvent extends LoginRegisterEvent {
  final Map<String, dynamic> userCredential;
  LoginWithDataButtonNavigateEvent({required this.userCredential});
}

class RegisterWithDataButtonNavigateEvent extends LoginRegisterEvent {
  final Map<String, dynamic> userCredential;
  RegisterWithDataButtonNavigateEvent({required this.userCredential});
}

class LogoutButtonNavigateEvent extends LoginRegisterEvent {}

class OnPasswordVisibilityEvent extends LoginRegisterEvent {
  //final bool isPasswordVisible;

  //OnPasswordVisibilityEvent({required this.isPasswordVisible});
}

class NotificationButtonNavigateEvent extends LoginRegisterEvent {}

class MyOrdersButtonNavigateEvent extends LoginRegisterEvent {}

class AddressShowBottomSheetEvent extends LoginRegisterEvent {}

class AddressSaveAddressButtonEvent extends LoginRegisterEvent {
  final String deliveryAddress;

  AddressSaveAddressButtonEvent({required this.deliveryAddress});
}

class UpdateUsernameOnFieldSubmittedEvent extends LoginRegisterEvent {
  final String username;

  UpdateUsernameOnFieldSubmittedEvent({required this.username});
}
