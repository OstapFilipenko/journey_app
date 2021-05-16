import 'package:flutter/material.dart';
import 'package:journey_app/Models/Journey.dart';
import 'package:journey_app/Services/FireStorage.dart';
import 'package:journey_app/Widgets/CardListTile.dart';

class JourneyCard extends StatelessWidget {
  JourneyCard({this.journey});
  Journey journey;

  Future<NetworkImage> _getImage(BuildContext context, String imageName) async {
    NetworkImage image;
    await FireStorage.loadImage(context, imageName, journey.id).then((value) {
      image = NetworkImage(value.toString());
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      child: new FutureBuilder(
        future: _getImage(context, 'main.jpg'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: snapshot.data,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: CardListTile(
                journey: journey,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Container(
              child: new Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
