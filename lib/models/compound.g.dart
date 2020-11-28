// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Compound _$CompoundFromJson(Map<String, dynamic> json) {
  return Compound(
    (json['main'] as List)
        ?.map((e) =>
            e == null ? null : ElementN.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['parentheses'] == null
        ? null
        : Compound.fromJson(json['parentheses'] as Map<String, dynamic>),
    canHaveParentheses: json['canHaveParentheses'] as bool,
  )..parenthesesN = json['parenthesesN'] as int;
}

Map<String, dynamic> _$CompoundToJson(Compound instance) => <String, dynamic>{
      'main': instance.main,
      'parentheses': instance.parentheses,
      'parenthesesN': instance.parenthesesN,
      'canHaveParentheses': instance.canHaveParentheses,
    };
