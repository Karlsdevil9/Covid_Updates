import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './Worldwide.dart';
import './Statewise.dart';

class IndiaCases extends StatelessWidget {
  final String confirmed, active, recovered, deaths, lastUpadtedTime, stateName;
  final bool isState;

  IndiaCases(
      {this.active,
      this.confirmed,
      this.recovered,
      this.deaths,
      this.lastUpadtedTime,
      this.isState,
      this.stateName});
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
              elevation: 5,
              child: Expanded(
                child: Container(
                  height: ((MediaQuery.of(context).size.height) -
                          (MediaQuery.of(context).padding.top)) *
                      0.25,
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
                                color: Colors.redAccent,
                                height: 20,
                                width: 20,
                              ),
                              Text("Deaths"),
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isState)
            Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                height: ((MediaQuery.of(context).size.height) -
                        (MediaQuery.of(context).padding.top)) *
                    0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("State Name"),
                            stateName != null ? Text(stateName) : Text("-----"),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          Container(
            padding: EdgeInsets.all(15),
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top)) *
                0.2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 5,
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
                    elevation: 5,
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
                    (MediaQuery.of(context).padding.top)) *
                0.2,
            padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 5,
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
                    elevation: 5,
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
            height: ((MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).padding.top)) *
                0.12,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 5,
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
          if (!isState)
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
            ),
        ],
      ),
    );
  }
}
