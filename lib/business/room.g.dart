// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int,
      room_name: json['room_name'] as String,
      building_floor: json['building_floor'] as int,
      detected: json['detected'] as bool,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'room_name': instance.room_name,
      'building_floor': instance.building_floor,
      'detected': instance.detected,
    };
