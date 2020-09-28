import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:fl_chart/fl_chart.dart';

class Worldwide extends StatefulWidget {
  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  Map cases;
  Future fetchWorldwideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    debugPrint(response.body);
    setState(() {
      cases = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldwideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Covid19_Updates")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Card(
              child: Expanded(
                child: Container(
                  height: 200,
                  child: Row(
                    children: [
                      PieChart(
                        PieChartData(
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          borderData: FlBorderData(show: false),
                          sections: [
                            PieChartSectionData(
                              showTitle: false,
                              value: double.parse(cases["active"].toString()),
                              color: Colors.deepOrangeAccent,
                              title: "Active",
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              title: "Recovered",
                              color: Colors.green,
                              value:
                                  double.parse(cases["recovered"].toString()),
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              title: "Deaths",
                              color: Colors.redAccent,
                              value: double.parse(cases["deaths"].toString()),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                        Text(cases["cases"].toString())
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
                        Text(cases["active"].toString()),
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
                        Text(cases["recovered"].toString())
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
                        Text(cases["deaths"].toString())
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
                        Text("Affected Country"),
                        Text(cases["affectedCountries"].toString())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
