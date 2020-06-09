import 'package:flutter/material.dart';
import 'statistics_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text("Covid-19 Tracker"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black26,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            children: <Widget>[
              Container(
                child: Text("Malaysia",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 30,
                ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              StatisticsData()
            ],
          ),
        ),
      ),
    );
  }
}
