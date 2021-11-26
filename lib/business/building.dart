import 'package:json_annotation/json_annotation.dart';
import 'package:popup_meeting_rooms/business/floor.dart';

part 'building.g.dart';

@JsonSerializable()
class Building {
  Building(this.building_name, this.floors); // this.building_id,

  //int building_id;
  String building_name;
  List<Floor> floors;

  factory Building.fromJson(Map<String, dynamic> json) => _$BuildingFromJson(json);
  Map<String, dynamic> toJson() => _$BuildingToJson(this);

}