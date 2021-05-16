class Tag {
  int _id;
  String _name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag.withParams(
    json["id"],
    json["name"],
  );

  Map<String, dynamic> toJson() => {
      "id": this._id,
      "name": this._name,
  };

  Tag.withParams(int id, String name) {
    this._id = id;
    this._name = name;
  }

  int get id => this._id;

  set id(int value) => this._id = value;

  get name => this._name;

  set name(value) => this._name = value;


  @override
  String toString() {
    return super.toString();
  }
}
