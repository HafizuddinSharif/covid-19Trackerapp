import 'package:flutter/material.dart';

class CardData extends StatelessWidget {

  final String title;
  final String number;
  final Color color;

  CardData({this.title, this.number, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title ?? "No Title",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        ),
        trailing: Text(number ?? "0",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    );
  }
}
