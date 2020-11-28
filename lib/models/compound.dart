import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/element.dart';
import 'package:nomenclatura_e_moli/models/element_n.dart';

part 'compound.g.dart';

@JsonSerializable()
class Compound {
  List<ElementN> main;
  Compound parentheses;
  int parenthesesN;
  final bool canHaveParentheses;

  Compound(this.main, this.parentheses, {this.canHaveParentheses = true});

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
