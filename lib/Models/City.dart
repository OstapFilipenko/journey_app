class City {
  int _id;
  String _name;
  int _lat;
  int _long;

  City() {}

  City.withParams(int id, String name, int lat, int long) {
    this._id = id;
    this._name = name;
    this._lat = lat;
    this._long = long;
  }

  int get id => this._id;

  set id(int value) => this._id = value;

  get name => this._name;

  set name(value) => this._name = value;

  get lat => this._lat;

  set lat(value) => this._lat = value;

  get long => this._long;

  set long(value) => this._long = value;

  @override
  String toString() {
    return super.toString();
  }
}
