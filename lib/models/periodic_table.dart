import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nomenclatura_e_moli/models/element.dart';
part 'periodic_table.g.dart';

@JsonSerializable()
class PeriodicTable {
  static PeriodicTable _instance;
  final List<Element> elements;

  static Future<PeriodicTable> initialize() async {
    var result = await rootBundle
        .loadString("res/data.json")
        .then((value) => {PeriodicTable.fromJson(jsonDecode(value))});
    _instance = result.first;
    return _instance;
  }

  static PeriodicTable get() {
    return _instance;
  }

  Element search(String symbol) {
    Element result;
    elements.forEach((element) {
      if (element.symbol == symbol) result = element;
    });
    return result;
  }

  PeriodicTable(this.elements) {
    elements.sort((a, b) => a.atomicNumber.compareTo(b.atomicNumber));
  }

  factory PeriodicTable.fromJson(Map<String, dynamic> json) =>
      _$PeriodicTableFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodicTableToJson(this);
}
