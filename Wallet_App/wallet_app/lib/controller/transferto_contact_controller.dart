import 'package:get/get.dart';
import 'package:wallet_app/model/transferto_contact_model.dart';

class TransferToContactController extends GetxController {
  ///LIST OF CONTACTS
  List<TransferToContactModel> contactList = [
    const TransferToContactModel(
        contactImg: "assets/images/home/profile.png",
        contactName: "Teja",
        phone: "+91 7087545461"),
    const TransferToContactModel(
        contactImg: "assets/images/home/ahmad.png",
        contactName: "Vishu",
        phone: "+91 9187545461"),
    const TransferToContactModel(
        contactImg: "assets/images/home/steve.png",
        contactName: "Steve",
        phone: "+91 8587545461"),
    const TransferToContactModel(
        contactImg: "assets/images/home/mark.png",
        contactName: "Nehal",
        phone: "+91 8087545461"),
    const TransferToContactModel(
        contactImg: "assets/images/home/ahmad.png",
        contactName: "Suraj",
        phone: "+91 7087545461")
  ].obs;

  ///CURRENTLY SELECTED CONTACT
  TransferToContactModel? _selectedContact;

  ///GETTER FOR THE SELECTED CONTACT

  TransferToContactModel? get selectedContact => _selectedContact;

  ///SET SELECTEDCONTACT
  void selectContact(TransferToContactModel contact) {
    _selectedContact = contact;
  }
}
