import 'package:journey_app/Models/City.dart';
import 'package:journey_app/Models/Tag.dart';

class Journey {
  int _id;
  String _title;
  String _description;
  int _year;
  String _month;
  int _day;
  bool _is_saved;
  String _mainImagePath;
  List<Tag> _tags;
  City _city;
  List<String> _allImagesPahts;

  Journey() {}

  Journey.withParams(
      int id,
      String title,
      String description,
      int year,
      String month,
      int day,
      bool is_saved,
      String mainImagePath,
      List<Tag> tags,
      City city,
      List<String> allImagePaths) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._year = year;
    this._month = month;
    this._day = day;
    this._is_saved = is_saved;
    this._mainImagePath = mainImagePath;
    this._tags = tags;
    this._city = city;
    this._allImagesPahts = allImagePaths;
  }

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

  get is_saved => this._is_saved;

  set is_saved(value) => this._is_saved = value;

  get mainImagePath => this._mainImagePath;

  set mainImagePath(value) => this._mainImagePath = value;

  get tags => this._tags;

  set tags(value) => this._tags = value;

  get city => this._city;

  set city(value) => this._city = value;

  get allImagesPahts => this._allImagesPahts;

  set allImagesPahts(value) => this._allImagesPahts = value;

  @override
  String toString() {
    return super.toString();
  }
}
