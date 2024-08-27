///Model representing Rooms
///MODEL REPRESENTING ROOMS
class RoomModel{
  final String roomImg; /// URL OR ASSET PATH TO THE ROOM IMAGE
  final String roomName; ///NAME OF ROOM
  List? devices; //LIST OF DEVICES

  RoomModel({required this.roomImg,required this.roomName,this.devices});
}