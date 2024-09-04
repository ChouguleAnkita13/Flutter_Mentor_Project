import 'package:wallet_app/model/transaction_details_model.dart';
///TRANSACTION MODEL
class TransactionModel {
  final String dayDate;///DAY AND DATE OF TRANSACTION 
  List<TransactionDetailsModel> transactionDetails;///LIST OF TRANSACTIONS DONE 

  TransactionModel({required this.dayDate, required this.transactionDetails});
}
