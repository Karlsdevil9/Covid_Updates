import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:fl_chart/fl_chart.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Card(
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 200,
                    child: Row(
                      children: [
                        PieChart(
                          PieChartData(
                            borderData: FlBorderData(show: false),
                            sections: [
                              PieChartSectionData(
                                showTitle: false,
                                value: double.parse(cases[0]["active"]),
                                color: Colors.deepOrangeAccent,
                                title: "Active",
                              ),
                              PieChartSectionData(
                                showTitle: false,
                                title: "Recovered",
                                color: Colors.green,
                                value: double.parse(
                                  cases[0]["recovered"],
                                ),
                              ),
                              PieChartSectionData(
                                showTitle: false,
                                title: "Deaths",
                                color: Colors.redAccent,
                                value: double.parse(cases[0]["deaths"]),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  color: Colors.deepOrangeAccent,
                                  height: 20,
                                  width: 20,
                                ),
                                Text("Active"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  color: Colors.greenAccent,
                                  height: 20,
                                  width: 20,
                                ),
                                Text("Recovered"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  color: Colors.redAccent,
                                  height: 20,
                                  width: 20,
                                ),
                                Text("Deaths"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Confirmed"),
                          Text("${cases[0]["confirmed"]}")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Active"),
                          Text("${cases[0]["active"]}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Recovered"),
                          Text("${cases[0]["recovered"]}")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Deaths"),
                          Text("${cases[0]["deaths"]}")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Last_Updated_Time"),
                          Text("${cases[0]["lastupdatedtime"]}")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: ButtonTheme(
                      minWidth: 190,
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("Statewise"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: ButtonTheme(
                      height: 60,
                      minWidth: 190,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text("WorldWide"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
