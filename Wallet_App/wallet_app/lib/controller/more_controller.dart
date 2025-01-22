import 'package:get/get.dart';
import 'package:wallet_app/model/more_model.dart';

///CONTROLLER FOR SHOWING MORE ITEMS
class MoreController extends GetxController {
  ///LIST OF ITEMS SHOWING ON CLICKED ON MORE BUTTON OF BOTTOMNAVIGATION BAR
  final List<MoreModel> moreItemList = [
    const MoreModel(
        moreImgUrl: "assets/images/more/paybill.png", moreTitle: "Pay bills"),
    const MoreModel(
        moreImgUrl: "assets/images/more/transfer.png", moreTitle: "Transfer"),
    const MoreModel(
        moreImgUrl: "assets/images/more/topup.png", moreTitle: "Topup"),
    const MoreModel(
        moreImgUrl: "assets/images/more/withdraw.png", moreTitle: "Withdraw"),
    const MoreModel(
        moreImgUrl: "assets/images/more/analytics.png", moreTitle: "Analytics"),
    const MoreModel(
        moreImgUrl: "assets/images/more/help.png", moreTitle: "Help"),
    const MoreModel(
        moreImgUrl: "assets/images/more/contactus.png",
        moreTitle: "Contact us"),
    const MoreModel(
        moreImgUrl: "assets/images/more/about.png", moreTitle: "About"),
  ];
}
