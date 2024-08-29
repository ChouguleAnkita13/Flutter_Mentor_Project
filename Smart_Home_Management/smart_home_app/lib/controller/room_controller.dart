import 'package:flutter/material.dart';
import 'package:smart_home_app/model/device_model.dart';
import 'package:smart_home_app/model/room_model.dart';

/// CONTROLLER FOR MANAGING ROOM DATA,SELECT ROOM AND SELECTED DEVICE
class RoomController extends ChangeNotifier {
  ///LIST OF ROOMS WITH IMG,NAME AND DEVICES LIST
  List roomList = [
    RoomModel(roomImg: "assets/images/livingroom.jpg", roomName: "Living Room"),
    RoomModel(roomImg: "assets/images/kitchen.jpg", roomName: "Kitchen"),
    RoomModel(
        roomImg: "assets/images/bedroom.jpg",
        roomName: "Bedroom",
        ///Devices LIST
        devices: [
          const DeviceModel(
              deviceImg: "assets/images/ehco2.png",
              deviceName: "Amazon Echo 2"),
          const DeviceModel(
              deviceImg: "assets/images/ascreen.png",
              deviceName: "Amazon Screen"),
          const DeviceModel(
              deviceImg: "assets/images/nest_tempra.png",
              deviceName: "Nest Tempra"),
        ]),
    RoomModel(roomImg: "assets/images/livingroom.jpg", roomName: "Living Room"),
    RoomModel(roomImg: "assets/images/kitchen.jpg", roomName: "Kitchen"),
  ];
  ///CURRENTLY SELECTED ROOM AND DEVICE
  RoomModel? _selectedRoom;
  DeviceModel? _selectedDevice;

  ///GETTER FOR THE SELECTED ROOM AND DEVICE
  RoomModel? get selectedRoom => _selectedRoom;
  DeviceModel? get selectedDevice => _selectedDevice;

  /// SETS THE CURRENTLY SELECTED ROOM AND NOTIFIES LISTENERS
  void selectRoom(RoomModel room) {
    _selectedRoom = room;
    notifyListeners();
  }

   /// SETS THE CURRENTLY SELECTED ROOM AND NOTIFIES LISTENERS
  void selectDevice(DeviceModel device) {
    _selectedDevice = device;
    notifyListeners();
  }
}
