import 'package:get/get.dart';

/// CONTROLLER FOR MANAGING LOGIN DATA,USING MOBILE,EMAIL,PASSWORD

class LoginController extends GetxController {
  bool _isUseEmail = true;
  bool _isPassVisible = true;
  bool _isChecked = false;

  ///GETTER FOR TOGGLE EMAILTEXTFIELD , PASSWORD VISIBILITY AND CHECKBOX

  get isUseEmail => _isUseEmail;
  get isPassVisible => _isPassVisible;
  get isChecked => _isChecked;

  ///METHOD TO TOGGLE EMAIL TO MOBILE
  void selectEmailOrMobile() {
    _isUseEmail = !_isUseEmail;
    update();

    ///UPDATE LISTENERS WHEN THE EMAIL STATE CHANGES
  }

  ///METHOD TO TOGGLE EMAIL TO MOBILE
  void selectPasswordVisibility() {
    _isPassVisible = !_isPassVisible;
    update();

    ///UPDATE LISTENERS WHEN THE PASSWORD VISIBILTY STATE CHANGES
  }

  ///METHOD TO TOGGLE CHECKBOX
  void selectCheckBox() {
    _isChecked = !_isChecked;
    update();

    ///UPDATE LISTENERS WHEN THE CHECKBOX STATE CHANGES
  }
}
