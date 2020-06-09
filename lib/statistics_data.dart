import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatisticsData extends StatefulWidget {
  @override
  _StatisticsDataState createState() => _StatisticsDataState();
}

class _StatisticsDataState extends State<StatisticsData> {

  String recovered;
  String newCases;
  String deaths;
  String active;
  bool received = false;

  Future<String> getData(key, key2) async {
    final url =  "https://covid-193.p.rapidapi.com/statistics?country=Malaysia";

    http.Response response = await http.get(
      Uri.encodeFull(url),
        headers: {
          "Accept": "application/json",
          "x-rapidapi-host": "covid-193.p.rapidapi.com",
          "x-rapidapi-key": "5a891006cdmsh79fdfa082606094p164b8djsn5c458cf20752",
        }
    );

    LinkedHashMap data = jsonDecode(response.body);
    List data1 = data.putIfAbsent("response", () => null);
    LinkedHashMap cases = data1[0].putIfAbsent(key2, () => null);
    String specificData = cases.putIfAbsent(key, () => null).toString();

    return specificData;
  }

  getAllData() {
    getData("new", "cases").then((value) => setState(() {
      newCases = value;
    }));
    getData("active", "cases").then((value) => setState(() {
      active = value;
    }));
    getData("recovered", "cases").then((value) => setState(() {
      recovered = value;
    }));
    getData("total", "deaths").then((value) => setState(() {
      deaths = value;
      received = true;
    }));
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardData(
          title: "New Cases",
          number: newCases,
          color: Colors.orangeAccent,
        ),
        CardData(
          title: "Active",
          number: active,
          color: Colors.blueAccent,
        ),
        CardData(
          title: "Recovered",
          number: recovered,
          color: Colors.lightGreen,
        ),
        CardData(
          title: "Death",
          number: deaths,
          color: Colors.redAccent,
        ),
        SizedBox(
          height: 100.0,
        ),
        if (!received) CircularProgressIndicator(),
        if (received) FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.refresh, color: Colors.black26,),
          onPressed: () {
            setState(() {
              received = false;
            });
            getAllData();
          },
        ),
      ],
    );
  }
}
