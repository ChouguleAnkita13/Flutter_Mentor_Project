///MODEL CLASS FOR SAVED BILLS
class SavedBillModel {
  final String billImgUrl; //IMAGE URL FOR BILL
  final String billTitle; //TITLE OF BILL
  final double totalBill; // TOTAL
  final String date; //
  final String time;
  final bool payStatus;
  final int transactionNo;

  const SavedBillModel(
      {required this.billImgUrl,
      required this.billTitle,
      required this.totalBill,
      required this.date,
      required this.time,
      required this.payStatus,
      required this.transactionNo});
}
