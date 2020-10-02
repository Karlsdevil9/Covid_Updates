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
bool dataFetched = false;

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
      dataFetched = true;
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
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(title: Text("Covid19_Updates")),
      body: dataFetched
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                  child: Card(
                    color: Color.fromRGBO(230, 230, 230, 1),
                    elevation: 5,
                    child: Expanded(
                      child: Container(
                        height: ((MediaQuery.of(context).size.height) -
                                (MediaQuery.of(context).padding.top) -
                                (kToolbarHeight) -
                                (kBottomNavigationBarHeight)) *
                            0.30,
                        child: Row(
                          children: [
                            active != null
                                ? Container(
                                    width: 250,
                                    child: PieChart(
                                      PieChartData(
                                        startDegreeOffset: 10,
                                        sectionsSpace: 0,
                                        centerSpaceRadius: 45,
                                        borderData: FlBorderData(show: false),
                                        sections: [
                                          PieChartSectionData(
                                            showTitle: false,
                                            value: double.parse(active),
                                            color:
                                                Color.fromRGBO(25, 49, 103, 1),
                                            title: "Active",
                                          ),
                                          PieChartSectionData(
                                            showTitle: false,
                                            title: "Recovered",
                                            color:
                                                Theme.of(context).primaryColor,
                                            value: double.parse(recovered),
                                          ),
                                          PieChartSectionData(
                                            showTitle: false,
                                            title: "Deaths",
                                            color:
                                                Color.fromRGBO(255, 77, 77, 1),
                                            value: double.parse(deaths),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : new Center(
                                    child: new CircularProgressIndicator()),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        color: Color.fromRGBO(25, 49, 103, 1),
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "Active",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        color: Color.fromRGBO(255, 77, 77, 1),
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "Deaths",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        color: Theme.of(context).primaryColor,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Text(
                                        "Recovered",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Confirmed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              cases != null
                                  ? Text(
                                      confirmed,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Active",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              active != null
                                  ? Text(
                                      active,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0"),
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
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Recovered",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              recovered != null
                                  ? Text(
                                      recovered,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          elevation: 5,
                          color: Color.fromRGBO(230, 230, 230, 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Deaths",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              deaths != null
                                  ? Text(
                                      deaths,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
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
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Today Cases",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              todayCases != null
                                  ? Text(
                                      todayCases,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Today Deaths",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              todayDeaths != null
                                  ? Text(
                                      todayDeaths,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
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
                      0.13,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Affected Country",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17)),
                              affectedCountries != null
                                  ? Text(
                                      affectedCountries,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text("0")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : new Center(
              child: new CircularProgressIndicator(),
            ),
    );
  }
}
