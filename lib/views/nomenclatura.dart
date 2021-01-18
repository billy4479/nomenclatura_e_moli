import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomenclatura_e_moli/logic/parse.dart';
import 'package:nomenclatura_e_moli/models/compound.dart';

class Nomenclatura extends StatefulWidget {
  const Nomenclatura({Key key}) : super(key: key);

  @override
  _NomenclaturaState createState() => _NomenclaturaState();
}

class _NomenclaturaState extends State<Nomenclatura> {
  final inputController = TextEditingController();
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: inputController,
          ),
          Divider(height: 25),
          RaisedButton(
            child: Text("Calculate"),
            onPressed: () {
              setState(() {
                output = Parser.parse(Compound.parse(inputController.text));
              });
            },
          ),
          Divider(height: 25),
          Text(output)
        ],
      ),
    );
  }
}
