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
      appBar: AppBar(
        title: Text("CovidUpdates"),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "StateName",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "TotalCases",
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: cases == null ? 0 : (cases.length - 1),
              itemBuilder: (context, index) {
                if (cases[index + 1]["state"] == "State Unassigned") {
                } else {
                  return Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    height: 70,
                    child: new Card(
                      elevation: 5,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            cases[index + 1]["state"],
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            cases[index + 1]["confirmed"],
                            textAlign: TextAlign.right,
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
