class Destination {
  int _id;
  String _country;
  String _city;
  double _lat;
  double _long;

  Destination() {}

  Destination.withParams(int id, String country, String city, double lat, double long) {
    this._id = id;
    this._country = country;
    this._city = city;
    this._lat = lat;
    this._long = long;
  }

   factory Destination.fromJson(Map<String, dynamic> json) => Destination.withParams(
        json["id"],
        json["country"],
        json["city"],
        json["lat"].toDouble(),
        json["long"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "city": city,
        "lat": lat,
        "long": long,
    };

  int get id => this._id;

  set id(int value) => this._id = value;

  get country => this._country;

  set country(value) => this._country = value;

  get city => this._city;

  set city(value) => this._city = value;

  get lat => this._lat;

  set lat(value) => this._lat = value;

  get long => this._long;

  set long(value) => this._long = value;

  @override
  String toString() {
    return super.toString();
  }
}
