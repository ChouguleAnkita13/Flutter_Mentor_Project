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

class NotificationButtonNavigateEvent extends LoginRegisterEvent {}
