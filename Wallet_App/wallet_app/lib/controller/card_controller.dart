import 'package:get/get.dart';

///CONTROLLER FOR PAYMENT CARDS
class CardController extends GetxController {
  ///LIST OF CARDS
  List cardsList = [
    "assets/images/more/Card 1.png",
    "assets/images/more/Card 2.png",
    "assets/images/more/Card 3.png",
    "assets/images/more/Card 1.png",
    "assets/images/more/Card 2.png",
    "assets/images/more/Card 3.png",
  ];

  ///CURRENTLY SELECTED CARD
  String? _selectedCard;

  ///GETTER FOR THE SELECTED CARD
  String? get selectedCard => _selectedCard;

  ///SET A SELECTEDCARD
  void selectCard(String card) {
    _selectedCard = card;
    update();
  }
}
