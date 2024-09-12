import 'package:get/get.dart';
import 'package:wallet_app/controller/bill_controller.dart';
import 'package:wallet_app/controller/more_controller.dart';
import 'package:wallet_app/controller/navigation_controller.dart';
import 'package:wallet_app/controller/transaction_controller.dart';
import 'package:wallet_app/controller/transferto_contact_controller.dart';

/// CLASS THAT IMPLEMENTS THE BINDINGS FOR DEPENDENCY INJECTION
class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    /// INSTANTIATING NAVIGATIONCONTROLLER FOR BOTTOM NAVIGATION MANAGEMENT
    Get.put(NavigationController());

    /// INSTANTIATING TRANSFERTOCONTACTCONTROLLER FOR CONTACT TRANSFER FUNCTIONALITY
    Get.put(TransferToContactController());

    /// INSTANTIATING TRANSACTIONCONTROLLER TO HANDLE TRANSACTIONS
    Get.put(TransactionController());

    /// INSTANTIATING MORECONTROLLER FOR 'MORE' SCREEN FUNCTIONALITIES
    Get.put(MoreController());

    /// INSTANTIATING BILLCONTROLLER TO HANDLE BILL MANAGEMENT
    Get.put(BillController());
  }
}
