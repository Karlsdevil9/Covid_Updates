import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class Worldwide extends StatefulWidget {
  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  @override
  String url = "https:// corona.lmao.ninja/v2/all";
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
