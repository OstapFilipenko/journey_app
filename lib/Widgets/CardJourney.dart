import 'package:flutter/material.dart';
import 'package:journey_app/Models/Journey.dart';
import 'package:journey_app/Services/FireStorage.dart';

class CardJourney extends StatelessWidget {
  CardJourney({this.journey});
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: new EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 6.0,
      ),
      child: new FutureBuilder(
        future: _getImage(context, 'main.jpg'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: new Image(
                      image: snapshot.data,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new SizedBox(
                  height: 10,
                ),
                new Text(
                  journey.title,
                  style: TextStyle(
                    fontSize: 19
                  ),
                ),
                new Text(
                  journey.tags.toString()
                ),
              ],
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
