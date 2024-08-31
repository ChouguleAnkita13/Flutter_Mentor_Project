import 'package:flutter/material.dart';

class DeviceOperator extends ChangeNotifier {
  bool _isWifiOn = true;
  bool _isAlarmOn = false;
  bool _isSwitchOn = true;
  bool _isMute=true;

  ///GETTER FOR TOGGLE WIFI,ALARAM ,SWITCH AND MUTE
  bool get isWifiOn => _isWifiOn;
  bool get isAlarmOn => _isAlarmOn;
  bool get isSwitchOn=>_isSwitchOn;
  bool get isMute=>_isMute;

  void toggleWiFi() {
    _isWifiOn = !_isWifiOn;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE WIFI STATE CHANGES
  }

  void toggleAlarm() {
    _isAlarmOn = !_isAlarmOn;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE ALARAM STATE CHANGES
  }

  void toggleSwitch() {
    _isSwitchOn = !_isSwitchOn;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE SWITCH STATE CHANGES
  }

   void toggleMute() {
    _isMute = !_isMute;
    notifyListeners();

    ///NOTIFIES LISTENERS WHEN THE MUTE STATE CHANGES
  }
}
