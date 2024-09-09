import 'package:get/get.dart';
import 'package:wallet_app/model/saved_bill_model.dart';

///BILL GETX CONTROLLER TO MANAGE THE STATE OF BILLS
class BillController extends GetxController {
  ///LIST OF ALL SAVED BILLERS
  List<SavedBillModel> savedBillList = [
    const SavedBillModel(
        billImgUrl: "assets/images/more/paybill.png",
        billTitle: "Electricity",
        totalBill: 132.32,
        date: "September 19, 2024",
        time: "12:32 ",
        payStatus: false,
        transactionNo: 23010412432431),
    const SavedBillModel(
        billImgUrl: "assets/images/more/water.png",
        billTitle: "Water",
        totalBill: 32.21,
        date: "September 19, 2024",
        time: "13:34 ",
        payStatus: false,
        transactionNo: 23010412432432),
    const SavedBillModel(
        billImgUrl: "assets/images/more/phone.png",
        billTitle: "Phone",
        totalBill: 21.46,
        date: "September 9, 2024",
        time: "2:32 ",
        payStatus: true,
        transactionNo: 23010412432434)
  ];

  ///CURRENTLY SELECTED BILL
  SavedBillModel? _selectedBill;

  ///GETTER FOR THE SELECTED BILL

  SavedBillModel? get selectedBill => _selectedBill;

  ///SET SELECTEDBILL
  void selectBill(SavedBillModel bill) {
    _selectedBill = bill;
  }
}
