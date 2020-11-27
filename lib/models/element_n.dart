import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/element.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

part 'element_n.g.dart';

@JsonSerializable()
class ElementN {
  Element element;
  int n;

  static PeriodicTable _pTable;

  ElementN(this.element, this.n);
  ElementN.fromString(String element, this.n) {
    if (_pTable == null) {
      _pTable = PeriodicTable.get();
    }
    for (var el in _pTable.elements) {
      if (el.symbol == element) this.element = el;
    }
  }

  bool isOk() {
    return element != null;
  }

  factory ElementN.fromJson(Map<String, dynamic> json) =>
      _$ElementNFromJson(json);

  Map<String, dynamic> toJson() => _$ElementNToJson(this);
}
