import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

class CalacoloMoli extends StatelessWidget {
  CalacoloMoli(this.periodicTable, {Key key}) : super(key: key);
  final PeriodicTable periodicTable;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text(jsonEncode(periodicTable.toJson()))],
    );
  }
}
