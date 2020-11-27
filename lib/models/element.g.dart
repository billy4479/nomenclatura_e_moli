// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Element _$ElementFromJson(Map<String, dynamic> json) {
  return Element(
    json['symbol'] as String,
    json['name'] as String,
    json['atomicNumber'] as int,
    (json['atomicWeight'] as num)?.toDouble(),
    _$enumDecodeNullable(_$TypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'atomicNumber': instance.atomicNumber,
      'atomicWeight': instance.atomicWeight,
      'type': _$TypeEnumMap[instance.type],
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

const _$TypeEnumMap = {
  Type.Metall: 'Metall',
  Type.NonMetall: 'NonMetall',
  Type.Metalloid: 'Metalloid',
  Type.Actinide: 'Actinide',
  Type.Lanthanide: 'Lanthanide',
  Type.NobleGas: 'NobleGas',
};
