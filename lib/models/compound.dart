import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/compount_type.dart';
import 'package:nomenclatura_e_moli/models/element.dart';
import 'package:nomenclatura_e_moli/models/element_n.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

part 'compound.g.dart';

@JsonSerializable()
class Compound {
  List<ElementN> main;
  Compound parentheses;
  int parenthesesN;
  final bool canHaveParentheses;
  CompoundType compoundType;
  int _totalLenth;

  static final Compound acqua = Compound(
    <ElementN>[
      ElementN(Element.Idrogeno, 2),
      ElementN(Element.Ossigeno, 1),
    ],
    null,
    CompoundType.Special,
    canHaveParentheses: false,
  );

  Compound(this.main, this.parentheses, this.compoundType,
      {this.canHaveParentheses = true}) {
    _totalLenth = (parentheses != null)
        ? main.length + parentheses._totalLenth
        : main.length;
  }

  bool has(Element e) {
    for (var element in main) {
      if (element.element.symbol == e.symbol) return true;
    }
    return false;
  }

  Compound.parse(String raw, {this.canHaveParentheses = true}) {
    main = List<ElementN>();

    List<String> data = List<String>();
    raw.runes.forEach((c) {
      data.add(String.fromCharCode(c));
    });

    var tmpSym = "";
    var tmpN = "null";

    for (int i = 0; i < data.length; i++) {
      if (data[i] == "(") {
        if (parentheses != null || !canHaveParentheses) {
          throw Exception("Too many parentheses");
        }
        var last = data.lastIndexOf(")");
        if (last == -1) {
          throw Exception("Unable to find closing parentheses");
        }

        // Parse what is inside the parentheses
        var sub = data
            .sublist(i + 1, last)
            .reduce((value, element) => value + element);
        parentheses = Compound.parse(sub, canHaveParentheses: false);

        // Everything after the parentheses
        var testN = data.sublist(last + 1);
        int endN = -1;
        for (int j = 0; j < testN.length; j++) {
          if (testN[j].contains(r"\w")) {
            endN = j;
            break;
          }
        }
        if (endN == -1) {
          endN = testN.length;
        }
        // Get last index of nums from testN

        var strN = testN
            .reduce((value, element) => value + element)
            .substring(0, endN);
        parenthesesN = int.parse(strN);

        i = last + strN.length;
      } else if (int.tryParse(data[i]) != null) {
        // Is number
        if (tmpN == "null") {
          tmpN = data[i];
        } else {
          tmpN += data[i];
        }
      } else if (data[i].toUpperCase() == data[i]) {
        // Is uppercase
        if (tmpSym != "") {
          main.add(ElementN.fromString(
              tmpSym, (tmpN != "null") ? int.parse(tmpN) : 1));
        }
        tmpSym = data[i];
        tmpN = "null";
      } else {
        // Is lowercase
        tmpSym += data[i];
      }
    }
    if (tmpSym != "") {
      main.add(
          ElementN.fromString(tmpSym, (tmpN != "null") ? int.parse(tmpN) : 1));
    }

    _totalLenth = (parentheses != null)
        ? main.length + parentheses._totalLenth
        : main.length;
    _getCompoundType();
  }

  void _getCompoundType() {
    final pTable = PeriodicTable.get();
    if (_totalLenth == 1) {
      if (parentheses == null) {
        compoundType = CompoundType.ElementoSingolo;
        return;
      }
      compoundType = CompoundType.Error;
      return;
    } else if (_totalLenth == 2) {
      if (has(pTable.search("H"))) {
        if (main.any((element) => element.element.type == Type.Metall)) {
          compoundType = CompoundType.IdruroMetallico;
        } else if (has(pTable.search("S")) ||
            has(pTable.search("F")) ||
            has(pTable.search("Br")) ||
            has(pTable.search("Cl")) ||
            has(pTable.search("I"))) {
          compoundType = CompoundType.Idracido;
        } else {
          compoundType = CompoundType.IdruroCovalente;
        }
        return;
      } else if (main.contains(pTable.search("O"))) {
        if (main.any((element) => element.element.type == Type.Metall)) {
          compoundType = CompoundType.OssidoBasico;
        } else {
          compoundType = CompoundType.OssidoAcido;
        }
        return;
      } else
        compoundType = CompoundType.SaleBinnario;
    } else if (_totalLenth == 3) {
      if (has(pTable.search("O")) && has(pTable.search("H"))) {
        // Ossoacido
        // Idrossido
      } else {
        // Sale ternario
      }
    } else {
      compoundType = CompoundType.Error;
      // O cose strane speciali
    }
  }

  bool contains(Element e) {
    for (var item in main) {
      if (item.element == e) return true;
    }
    if (parentheses != null) return parentheses.contains(e);
    return false;
  }

  factory Compound.fromJson(Map<String, dynamic> json) =>
      _$CompoundFromJson(json);

  Map<String, dynamic> toJson() => _$CompoundToJson(this);
}
