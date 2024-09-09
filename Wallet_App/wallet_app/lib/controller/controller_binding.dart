import 'package:get/get.dart';
import 'package:wallet_app/controller/bill_controller.dart';
import 'package:wallet_app/controller/more_controller.dart';
import 'package:wallet_app/controller/transaction_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
    Get.put(MoreController());
    Get.put(BillController());
  }
}
