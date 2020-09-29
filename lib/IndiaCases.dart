import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './Worldwide.dart';
import './Statewise.dart';

class IndiaCases extends StatelessWidget {
  final String confirmed, active, recovered, deaths, lastUpadtedTime;

  IndiaCases(
      {this.active,
      this.confirmed,
      this.recovered,
      this.deaths,
      this.lastUpadtedTime});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CovidUpdates"),
      ),
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
                        confirmed != null ? Text(confirmed) : Text("0"),
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
                        recovered != null ? Text(recovered) : Text("0"),
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
                        deaths != null ? Text(deaths) : Text("0"),
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
                        lastUpadtedTime != null
                            ? Text(lastUpadtedTime)
                            : Text("0")
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StatewiseCases(),
                          ),
                        );
                      },
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Worldwide(),
                          ),
                        );
                      },
                      child: Text("WorldWide"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
