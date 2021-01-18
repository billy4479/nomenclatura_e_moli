import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

part 'element.g.dart';

@JsonSerializable()
class Element {
  final String symbol;
  final String name;
  final int atomicNumber;
  final double atomicWeight;
  final Type type;

  static final Idrogeno = PeriodicTable.get().search("H");
  static final Ossigeno = PeriodicTable.get().search("O");

  Element(
      this.symbol, this.name, this.atomicNumber, this.atomicWeight, this.type);

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);

  Map<String, dynamic> toJson() => _$ElementToJson(this);
}

enum Type {
  Metall,
  NonMetall,
  Metalloid,
  Actinide,
  Lanthanide,
  NobleGas,
}
