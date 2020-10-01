import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:fl_chart/fl_chart.dart';

String confirmed,
    active,
    deaths,
    recovered,
    affectedCountries,
    todayDeaths,
    todayCases;

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
      confirmed = cases["cases"].toString();
      active = cases["active"].toString();
      deaths = cases["deaths"].toString();
      recovered = cases["recovered"].toString();
      affectedCountries = cases["affectedCountries"].toString();
      todayDeaths = cases["todayDeaths"].toString();
      todayCases = cases["todayCases"].toString();
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
            margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
            child: Card(
              child: Expanded(
                child: Container(
                  height: ((MediaQuery.of(context).size.height) -
                          (MediaQuery.of(context).padding.top) -
                          (kToolbarHeight) -
                          (kBottomNavigationBarHeight)) *
                      0.27,
                  child: Row(
                    children: [
                      active != null
                          ? PieChart(
                              PieChartData(
                                sectionsSpace: 0,
                                centerSpaceRadius: 40,
                                borderData: FlBorderData(show: false),
                                sections: [
                                  PieChartSectionData(
                                    showTitle: false,
                                    value: double.parse(active),
                                    color: Colors.deepOrangeAccent,
                                    title: "Active",
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    title: "Recovered",
                                    color: Colors.green,
                                    value: double.parse(recovered),
                                  ),
                                  PieChartSectionData(
                                    showTitle: false,
                                    title: "Deaths",
                                    color: Colors.redAccent,
                                    value: double.parse(deaths),
                                  )
                                ],
                              ),
                            )
                          : new Center(child: new CircularProgressIndicator()),
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
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top) -
                    (kToolbarHeight) -
                    (kBottomNavigationBarHeight)) *
                0.19,
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
                        cases != null ? Text(confirmed) : Text("0")
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
                        active != null ? Text(active) : Text("0"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top) -
                    (kToolbarHeight) -
                    (kBottomNavigationBarHeight)) *
                0.19,
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
                        recovered != null ? Text(recovered) : Text("0")
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
                        deaths != null ? Text(deaths) : Text("0")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top) -
                    (kToolbarHeight) -
                    (kBottomNavigationBarHeight)) *
                0.19,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Today Cases"),
                        todayCases != null ? Text(todayCases) : Text("0")
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
                        Text("Today Deaths"),
                        todayDeaths != null ? Text(todayDeaths) : Text("0")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top) -
                    (kToolbarHeight) -
                    (kBottomNavigationBarHeight)) *
                0.15,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Affected Country"),
                        affectedCountries != null
                            ? Text(affectedCountries)
                            : Text("0")
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
