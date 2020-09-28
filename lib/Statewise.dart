import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StatewiseCases extends StatefulWidget {
  @override
  _StatewiseCasesState createState() => _StatewiseCasesState();
}

class _StatewiseCasesState extends State<StatewiseCases> {
  Map data;
  List cases;

  Future getData() async {
    http.Response response =
        await http.get('https://api.covid19india.org/data.json');

    data = json.decode(response.body);
    setState(() {
      cases = data["statewise"];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cases == null ? 0 : (cases.length - 1),
        itemBuilder: (context, index) {
          if (cases[index + 1]["state"] == "State Unassigned") {
          } else {
            return new Row(
              children: [
                Text(cases[index + 1]["state"]),
                Text(cases[index + 1]["confirmed"])
              ],
            );
          }
        },
      ),
    );
  }
}
