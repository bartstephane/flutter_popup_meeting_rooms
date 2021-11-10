import 'package:json_annotation/json_annotation.dart';
import 'package:popup_meeting_rooms/business/room.dart';

part 'floor.g.dart';

@JsonSerializable()
class Floor {
  Floor(this.floor_id, this.floor_name, this.floor_rooms);

  int floor_id;
  String floor_name;
  List<Room> floor_rooms;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
  Map<String, dynamic> toJson() => _$FloorToJson(this);

}