import 'package:popup_meeting_rooms/business/room.dart';

class Floor {
  final int building_floor;
  final List<Room> rooms;

  const Floor({
    required this.building_floor,
    required this.rooms,
  });

}