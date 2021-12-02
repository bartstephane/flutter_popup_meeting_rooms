import 'package:json_annotation/json_annotation.dart';
import 'package:popup_meeting_rooms/business/floor.dart';
import 'package:popup_meeting_rooms/business/room.dart';

part 'building.g.dart';

@JsonSerializable()
class Building {
  Building(this.name, this.floors);

  String name;
  List<Floor> floors;

  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);
  Map<String, dynamic> toJson() => _$BuildingToJson(this);

  Room? findFloor(int floorNumber, int roomId) {
    for (Floor floor in floors) {
      if (floor.id == floorNumber) {
        for (Room room in floor.rooms) {
          if (room.id == roomId) {
            return room;
          }
        }
      }
    }
  }

}