import 'package:json_annotation/json_annotation.dart';
import 'package:popup_meeting_rooms/business/room.dart';

part 'floor.g.dart';

@JsonSerializable()
class Floor {
  Floor(this.id, this.rooms);

  int id;
  List<Room> rooms;

  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
  Map<String, dynamic> toJson() => _$FloorToJson(this);

}