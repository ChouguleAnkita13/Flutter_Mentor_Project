///MODEL CLASS FOR TRANSACTION DETAILS
class TransactionDetailsModel {
  final String imgUrl;
  final String transactionTitle;
  final double amount;
  final int transactionNo;
  final String time;
  final String date;

  const TransactionDetailsModel({
    required this.imgUrl,
    required this.transactionTitle,
    required this.amount,
    required this.transactionNo,
    required this.time,
    required this.date,
  });
}
