// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Floor _$FloorFromJson(Map<String, dynamic> json) => Floor(
      json['floor_id'] as int,
      json['floor_name'] as String,
      (json['floor_rooms'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FloorToJson(Floor instance) => <String, dynamic>{
      'floor_id': instance.floor_id,
      'floor_name': instance.floor_name,
      'floor_rooms': instance.floor_rooms,
    };
