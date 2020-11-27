// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periodic_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodicTable _$PeriodicTableFromJson(Map<String, dynamic> json) {
  return PeriodicTable(
    (json['elements'] as List)
        ?.map((e) =>
            e == null ? null : Element.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PeriodicTableToJson(PeriodicTable instance) =>
    <String, dynamic>{
      'elements': instance.elements,
    };
