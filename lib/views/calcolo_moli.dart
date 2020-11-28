import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nomenclatura_e_moli/models/reaction.dart';

class CalacoloMoli extends StatefulWidget {
  CalacoloMoli({Key key}) : super(key: key);

  @override
  _CalacoloMoliState createState() => _CalacoloMoliState();
}

class _CalacoloMoliState extends State<CalacoloMoli> {
  final TextEditingController _reagentsController = new TextEditingController();
  final TextEditingController _productsController = new TextEditingController();
  String reagents;
  String products;
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    JsonEncoder encoder = new JsonEncoder.withIndent('    ');
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        autofocus: false,
                        controller: _reagentsController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Reagenti",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.arrow_forward),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: TextFormField(
                        autofocus: false,
                        controller: _productsController,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Prodotti",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                ),
                RaisedButton(
                  child: Text("Calcola"),
                  onPressed: () {
                    setState(() {
                      _showResult = true;
                      products = _productsController.text;
                      reagents = _reagentsController.text;
                    });
                  },
                )
              ],
            ),
          ),
          Divider(
            height: 100,
          ),
          _showResult
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
                        child: Text(encoder
                            .convert(Reaction.parse(reagents, products))),
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
