import 'package:flutter/material.dart';

/// OTPCONTROLLER CLASS TO MANAGE OTP INPUT FIELDS
/// IT USES FOCUS NODES AND TEXT CONTROLLERS FOR EACH OTP FIELD
class OTPController extends ChangeNotifier {
  // CREATING FOCUS NODES FOR EACH OTP FIELD
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  // CREATING TEXT EDITING CONTROLLERS FOR EACH OTP FIELD
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  // GETTERS TO ACCESS THE FOCUS NODES AND TEXT CONTROLLERS
  List<FocusNode> get focusNodes => _focusNodes;
  List<TextEditingController> get controllers => _controllers;

  /// METHOD TO DISPOSE ALL FOCUS NODES AND CONTROLLERS WHEN NO LONGER NEEDED
  void disposeResources() {
    for (var controller in _controllers) {
      controller.dispose(); // DISPOSING EACH TEXT CONTROLLER
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose(); // DISPOSING EACH FOCUS NODE
    }
  }

  /// METHOD TO HANDLE USER INPUT AND SHIFT FOCUS BETWEEN FIELDS
  /// TAKES THE CURRENT INPUT VALUE AND FIELD INDEX AS PARAMETERS
  void handleInput(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      // IF INPUT IS NOT EMPTY AND NOT THE LAST FIELD, MOVE FOCUS TO NEXT FIELD
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      // IF INPUT IS EMPTY AND BACKSPACE IS PRESSED, MOVE FOCUS TO PREVIOUS FIELD
      _focusNodes[index - 1].requestFocus();
    }
    notifyListeners(); // NOTIFY LISTENERS ABOUT STATE CHANGES
  }
}
