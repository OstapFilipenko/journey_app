import 'package:journey_app/Models/Destination.dart';
import 'package:journey_app/Models/Tag.dart';

class Journey {
  int _id;
  String _title;
  String _description;
  int _year;
  String _month;
  int _day;
  bool _isSaved;
  String _mainImagePath;
  List<Tag> _tags;
  String _destination;
  List<String> _allImagesPaths;

  Journey() {}

  Journey.withParams(
      int id,
      String title,
      String description,
      int year,
      String month,
      int day,
      bool isSaved,
      String mainImagePath,
      List<Tag> tags,
      String destination,
      List<String> allImagePaths) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._year = year;
    this._month = month;
    this._day = day;
    this._isSaved = isSaved;
    this._mainImagePath = mainImagePath;
    this._tags = tags;
    this._destination = destination;
    this._allImagesPaths = allImagePaths;
  }

  factory Journey.fromJson(Map<String, dynamic> json) => Journey.withParams(
        json["id"],
        json["title"],
        json["description"],
        json["year"],
        json["month"],
        json["day"],
        json["isSaved"],
        json["mainImagePath"],
        getTags(List<String>.from(json["tags"].map((x) => x))),
        json["destination"],
        List<String>.from(json["allImagesPaths"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "year": year,
        "month": month,
        "day": day,
        "isSaved": isSaved,
        "mainImagePath": mainImagePath,
        "tags": "",
        //"tags": List<dynamic>.from(tags.map((x) => x)),
        "destination": destination,
        "allImagesPaths": List<dynamic>.from(allImagesPaths.map((x) => x)),
    };

  int get id => this._id;

  set id(int value) => this._id = value;

  get title => this._title;

  set title(value) => this._title = value;

  get description => this._description;

  set description(value) => this._description = value;

  get year => this._year;

  set year(value) => this._year = value;

  get month => this._month;

  set month(value) => this._month = value;

  get day => this._day;

  set day(value) => this._day = value;

  get isSaved => this._isSaved;

  set isSaved(value) => this._isSaved = value;

  get mainImagePath => this._mainImagePath;

  set mainImagePath(value) => this._mainImagePath = value;

  get tags => this._tags;

  set tags(value) => this._tags = value;

  get destination => this._destination;

  set destination(value) => this._destination = value;

  get allImagesPaths => this._allImagesPaths;

  set allImagesPaths(value) => this._allImagesPaths = value;

  @override
  String toString() {
    return super.toString();
  }
}

List<Tag> getTags(List<String> tags) {
  return null;
}
