import 'package:get/get.dart';
import 'package:wallet_app/controller/transaction_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController ()); 
  }
}