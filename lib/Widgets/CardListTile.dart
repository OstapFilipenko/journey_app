import 'package:flutter/material.dart';
import 'package:journey_app/Models/Journey.dart';

class CardListTile extends StatelessWidget {
  CardListTile({this.journey});
  Journey journey;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      title: new Text(
        journey.title,
        style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: new Text(
        journey.description,
        overflow: TextOverflow.visible,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
