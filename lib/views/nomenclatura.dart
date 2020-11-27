import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomenclatura_e_moli/models/compound.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

class Nomenclatura extends StatefulWidget {
  const Nomenclatura(this.periodicTable, {Key key}) : super(key: key);
  final PeriodicTable periodicTable;

  @override
  _NomenclaturaState createState() => _NomenclaturaState();
}

class _NomenclaturaState extends State<Nomenclatura> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            onSubmitted: (value) {
              setState(() {
                input = value;
              });
            },
          ),
          Divider(
            height: 100,
          ),
          (input != "")
              ? Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text((input != "")
                            ? encoder.convert(Compound.parse(input))
                            : ""),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
