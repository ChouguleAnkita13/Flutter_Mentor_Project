import 'package:get/get.dart';
import 'package:wallet_app/view/HistoryScreen/history_screen.dart';
import 'package:wallet_app/view/HomeScreen/home_screen.dart';
import 'package:wallet_app/view/LoginScreen/create_account_screen.dart';
import 'package:wallet_app/view/LoginScreen/login_screen.dart';
import 'package:wallet_app/view/LoginScreen/otp_screen.dart';
import 'package:wallet_app/view/LoginScreen/password_screen.dart';
import 'package:wallet_app/view/PaybillsScreen/paybills_screen.dart';
import 'package:wallet_app/view/PaybillsScreen/paysuccess_screen.dart';
import 'package:wallet_app/view/ProfileScreen/profile_screen.dart';
import 'package:wallet_app/view/TransferScreen/amount_screen.dart';
import 'package:wallet_app/view/TransferScreen/payfailed_screen.dart';
import 'package:wallet_app/view/TransferScreen/transfer_screen.dart';
import 'package:wallet_app/view/aboutus_screen.dart';
import 'package:wallet_app/view/more_screen.dart';
import 'package:wallet_app/view/splash_screen.dart';

class GetpagesController {
  static List<GetPage<dynamic>> getPagesList = [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/login", page: () => const LoginScreen()),
    GetPage(name: "/password", page: () => const PasswordScreen()),
    GetPage(name: "/createAc", page: () => const CreateAccountScreen()),
    GetPage(name: "/otpScreen", page: () => const OTPScreen()),
    GetPage(name: "/home", page: () => const HomeScreen()),
    GetPage(name: "/history", page: () => const HistoryScreen()),
    GetPage(name: "/more", page: () => const MoreScreen()),
    GetPage(name: "/about", page: () => const AboutUsScreen()),
    GetPage(name: "/profile", page: () => const ProfileScreen()),
    GetPage(name: "/paybills", page: () => const PaybillsScreen()),
    GetPage(name: "/paysuccess", page: () => const PaySuccessScreen()),
    GetPage(name: "/transfer", page: () => const TransferScreen()),
    GetPage(name: "/amountScreen", page: () => const AmountScreen()),
    GetPage(name: "/payfailed", page: () => const PayFailedScreen())
  ];
}
