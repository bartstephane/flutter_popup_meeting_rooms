// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) => Building(
      json['building_name'] as String,
      (json['floors'] as List<dynamic>)
          .map((e) => Floor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'building_name': instance.building_name,
      'floors': instance.floors,
    };
