import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid19Updates",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Covid19_Updates"),
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(20),
            children: [
              Card(
                child: Column(
                  children: [Text("Active"), Text("0")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Deaths"), Text("0")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Recovered"), Text("0")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Total"), Text("0")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Affected country"), Text("0")],
                ),
              ),
              Card(
                child: Column(
                  children: [Text("Last_Updated_Time"), Text("0")],
                ),
              ),
            ],
          )),
    );
  }
}
