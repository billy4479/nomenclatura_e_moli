// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reaction _$ReactionFromJson(Map<String, dynamic> json) {
  return Reaction(
    (json['reagents'] as List)
        ?.map((e) =>
            e == null ? null : Compound.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Compound.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'reagents': instance.reagents,
      'products': instance.products,
    };
