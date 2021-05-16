class Tag {
  int _id;
  String _name;

  Tag() {}

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
