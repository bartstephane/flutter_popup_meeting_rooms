// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      json['room_id'] as int,
      json['room_name'] as String,
      json['detected'] as bool,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'room_id': instance.room_id,
      'room_name': instance.room_name,
      'detected': instance.detected,
    };
