import 'package:get/get.dart';
import 'package:wallet_app/model/transaction_details_model.dart';
import 'package:wallet_app/model/transaction_model.dart';

///CONTROLLER TO MANAGE ALL TRANSACTIONS GETX CONTROLLER USED
class TransactionController extends GetxController {
  ///LIST OF TRANSACTIONS
  List<TransactionModel> transactionList = [
    ///TODAY'S
    TransactionModel(dayDate: "Today", transactionDetails: [
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/walmart.png",
          transactionTitle: "Walmart",
          amount: -36.23,
          transactionNo: 2098765432345,
          time: "12.32",
          date: "Today"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/topup.png",
          transactionTitle: "Top up",
          amount: 430,
          transactionNo: 2098765432345,
          time: "02.12",
          date: "Today"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/netflix.png",
          transactionTitle: "Netflix",
          amount: -13.00,
          transactionNo: 2098765432345,
          time: "13.53",
          date: "Today")
    ]),

    ///YESTERDAY'S
    TransactionModel(dayDate: "Yesterday", transactionDetails: [
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/amazon.png",
          transactionTitle: "Amazon",
          amount: -12.23,
          transactionNo: 2098765432345,
          time: "12.32",
          date: "Yesterday"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/nike.png",
          transactionTitle: "Nike",
          amount: -50.23,
          transactionNo: 2098765432345,
          time: "02.12",
          date: "Yesterday"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/homedepot.png",
          transactionTitle: "The Home Depot",
          amount: -129.00,
          transactionNo: 2098765432345,
          time: "13.53",
          date: "Yesterday")
    ]),

    ///MONTH
    TransactionModel(dayDate: "September 01,2024", transactionDetails: [
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/amazon.png",
          transactionTitle: "Amazon",
          amount: -12.23,
          transactionNo: 2098765432345,
          time: "12.32",
          date: "Sep 01"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/topup.png",
          transactionTitle: "Top up",
          amount: 525,
          transactionNo: 2098765432345,
          time: "01.23",
          date: "Sep 01"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/nike.png",
          transactionTitle: "Nike",
          amount: -50.23,
          transactionNo: 2098765432345,
          time: "02.12",
          date: "Sep 01"),
      const TransactionDetailsModel(
          imgUrl: "assets/images/history/homedepot.png",
          transactionTitle: "The Home Depot",
          amount: -129.00,
          transactionNo: 2098765432345,
          time: "13.53",
          date: "Sep 01")
    ])
  ];

  ///CURRENTLY SELECTED TRANSACTION
  TransactionDetailsModel? _selectedTransaction;

  ///GETTER FOR THE SELECTED TRANSACTION

  TransactionDetailsModel? get selectedTransaction => _selectedTransaction;

  void selectTransaction(TransactionDetailsModel transDetail) {
    _selectedTransaction = transDetail;
  }
}
