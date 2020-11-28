import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/compound.dart';

part 'reaction.g.dart';

@JsonSerializable()
class Reaction {
  List<Compound> reagents;
  List<Compound> products;

  Reaction(this.reagents, this.products);

  Reaction.parse(String reagentsRaw, String productsRaw) {
    reagents = reagentsRaw
        .trim()
        .split("+")
        .map((e) => Compound.parse(e.trim()))
        .toList();
    products = productsRaw
        .trim()
        .split("+")
        .map((e) => Compound.parse(e.trim()))
        .toList();
  }

  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionToJson(this);
}
