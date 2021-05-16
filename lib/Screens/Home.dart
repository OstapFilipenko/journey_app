import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:journey_app/Models/Journey.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Journey> journeys = [];
  final dbRef = FirebaseDatabase.instance.reference().child('entries');

  @override
  void initState() {
    getJourneys();
    super.initState();
  }

  void getJourneys() {
    dbRef.once().then((DataSnapshot snapshot) {
      setState(() {
        journeys = _parseData(snapshot);
      });
    });
  }

  List<Journey> _parseData(DataSnapshot dataSnapshot) {
    var journeyList = <Journey>[];
    List<dynamic>.from(dataSnapshot.value).forEach((value) {
      journeyList.add(Journey.fromJson(Map.from(value)));
    });
    return journeyList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text(journeys.length.toString()),
      ),
    );
  }
}