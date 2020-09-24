import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  List cases;
  Future getData() async {
    http.Response response =
        await http.get('https://api.covid19india.org/data.json');

    data = json.decode(response.body);
    setState(() {
      cases = data["statewise"];
    });
    debugPrint(cases[0].toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid19Updates",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Covid19_Updates"),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(20),
            children: [
              Card(
                child: Column(
                  children: [Text("Active"), Text("${cases[0]["active"]}")],
                ),
              ),
              Card(
                child: Center(
                  child: Column(
                    children: [
                      Text("Confirmed"),
                      Text("${cases[0]["confirmed"]}")
                    ],
                  ),
                ),
              ),
              Card(
                child: Center(
                  child: Column(
                    children: [
                      Text("Recovered"),
                      Text("${cases[0]["recovered"]}")
                    ],
                  ),
                ),
              ),
              Card(
                child: Center(
                  child: Column(
                    children: [Text("Deaths"), Text("${cases[0]["deaths"]}")],
                  ),
                ),
              ),
              Card(
                child: Center(
                  child: Column(
                    children: [
                      Text("Last_Updated_Time"),
                      Text("${cases[0]["lastupdatedtime"]}")
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
