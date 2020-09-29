import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import './IndiaCases.dart';
import 'package:flutter/services.dart';

String confirmed, active, recovered, deaths, lastUpadtedTime;
bool check = false;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data;
  List cases;

  Future getData() async {
    try {
      http.Response response =
          await http.get('https://api.covid19india.org/data.json');

      data = json.decode(response.body);
      setState(() {
        cases = data["statewise"];
        active = cases[0]["active"];
        confirmed = cases[0]["confirmed"];
        deaths = cases[0]["deaths"];
        recovered = cases[0]["recovered"];
        lastUpadtedTime = cases[0]["lastupdatedtime"];
        check = true;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: "Covid19Updates",
      home: Scaffold(
        body: check
            ? IndiaCases(
                active: active,
                confirmed: confirmed,
                deaths: deaths,
                recovered: recovered,
                lastUpadtedTime: lastUpadtedTime,
              )
            : new Center(child: new CircularProgressIndicator()),
      ),
    );
  }
}
