import 'package:json_annotation/json_annotation.dart';
import 'package:popup_meeting_rooms/business/room.dart';

part 'floor.g.dart';

@JsonSerializable()
class Floor {
  Floor(this.number, this.rooms); // this.floor_name,

  int number;
  //String floor_name;
  List<Room> rooms;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
  Map<String, dynamic> toJson() => _$FloorToJson(this);

}