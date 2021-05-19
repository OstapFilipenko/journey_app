import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:journey_app/Models/Journey.dart';
import 'package:journey_app/Widgets/CardJourney.dart';

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
    return journeys.isEmpty
        ? new Center (child: new CircularProgressIndicator(),) 
        : Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: journeys.length,
        itemBuilder: (BuildContext context, int index) {
          return new CardJourney(journey: journeys[index],);
        },
      ),
    );
  }
}
