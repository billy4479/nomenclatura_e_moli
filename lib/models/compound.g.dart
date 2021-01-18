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
    _$enumDecodeNullable(_$CompoundTypeEnumMap, json['compoundType']),
    canHaveParentheses: json['canHaveParentheses'] as bool,
  )..parenthesesN = json['parenthesesN'] as int;
}

Map<String, dynamic> _$CompoundToJson(Compound instance) => <String, dynamic>{
      'main': instance.main,
      'parentheses': instance.parentheses,
      'parenthesesN': instance.parenthesesN,
      'canHaveParentheses': instance.canHaveParentheses,
      'compoundType': _$CompoundTypeEnumMap[instance.compoundType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CompoundTypeEnumMap = {
  CompoundType.SaleBinnario: 'SaleBinnario',
  CompoundType.OssidoAcido: 'OssidoAcido',
  CompoundType.OssidoBasico: 'OssidoBasico',
  CompoundType.Idracido: 'Idracido',
  CompoundType.IdruroCovalente: 'IdruroCovalente',
  CompoundType.IdruroMetallico: 'IdruroMetallico',
  CompoundType.Idrossido: 'Idrossido',
  CompoundType.Ossiacido: 'Ossiacido',
  CompoundType.SaleTernario: 'SaleTernario',
  CompoundType.Ossoanione: 'Ossoanione',
  CompoundType.ElementoSingolo: 'ElementoSingolo',
  CompoundType.Error: 'Error',
  CompoundType.Special: 'Special',
};
