import 'package:flutter/material.dart';
import 'package:nomenclatura_e_moli/views/calcolo_moli.dart';
import 'package:nomenclatura_e_moli/views/nomenclatura.dart';
import 'package:nomenclatura_e_moli/models/periodic_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nomenclatura e calcolo delle moli',
      theme: ThemeData(
        primaryColor: Color(0xFF4CAF50),
        primaryColorLight: Color(0xFFC8E6C9),
        primaryColorDark: Color(0xFF388E3C),
        accentColor: Color(0xFF9E9E9E),
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          headline1: TextStyle(color: Color(0xFFFFFFFF), fontSize: 22),
          headline2: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
          bodyText1: TextStyle(color: Color(0xFF212121)),
          bodyText2: TextStyle(color: Color(0xFF757575)),
        ),
        dividerColor: Color(0xFFBDBDBD),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String activeTab = "Nomenclatura";
  PeriodicTable pTable = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activeTab,
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          FlatButton(
            child: Text(
              "Nomenclatura",
              style: Theme.of(context).textTheme.headline2,
            ),
            onPressed: () => {
              setState(() {
                activeTab = "Nomenclatura";
              }),
            },
          ),
          FlatButton(
            child: Text(
              "Calcolo Moli",
              style: Theme.of(context).textTheme.headline2,
            ),
            onPressed: () => {
              setState(() {
                activeTab = "Calcolo Moli";
              }),
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: PeriodicTable.initialize(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            pTable = snapshot.data;
            return Center(
                child: activeTab == "Nomenclatura"
                    ? Nomenclatura()
                    : CalacoloMoli());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
