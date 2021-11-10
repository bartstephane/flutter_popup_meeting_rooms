// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      json['building_id'] as int,
      json['building_name'] as String,
      (json['building_floors'] as List<dynamic>)
          .map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'building_id': instance.building_id,
      'building_name': instance.building_name,
      'building_floors': instance.building_floors,
    };
