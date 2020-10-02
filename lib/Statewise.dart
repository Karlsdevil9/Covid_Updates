import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './IndiaCases.dart';

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
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        title: Text("CovidUpdates"),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            child: Card(
              color: Color.fromRGBO(230, 230, 230, 1),
              elevation: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "State Name",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                  Text(
                    "Total Cases",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
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
                    child: Card(
                      color: Color.fromRGBO(230, 230, 230, 1),
                      elevation: 5,
                      child: new ListTile(
                        leading: Text(
                          cases[index + 1]["state"],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          cases[index + 1]["confirmed"],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndiaCases(
                                active: cases[index + 1]["active"],
                                confirmed: cases[index + 1]["confirmed"],
                                deaths: cases[index + 1]["deaths"],
                                lastUpadtedTime: cases[index + 1]
                                    ["lastupdatedtime"],
                                recovered: cases[index + 1]["recovered"],
                                isState: true,
                                stateName: cases[index + 1]["state"],
                              ),
                            ),
                          );
                        },
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
