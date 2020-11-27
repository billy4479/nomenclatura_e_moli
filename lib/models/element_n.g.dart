// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_n.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElementN _$ElementNFromJson(Map<String, dynamic> json) {
  return ElementN(
    json['element'] == null
        ? null
        : Element.fromJson(json['element'] as Map<String, dynamic>),
    json['n'] as int,
  );
}

Map<String, dynamic> _$ElementNToJson(ElementN instance) => <String, dynamic>{
      'element': instance.element,
      'n': instance.n,
    };
