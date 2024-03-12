class KeyList {
  late int id;
  late String key;

  KeyList(this.id, this.key);

  static KeyList fromMap(Map map) {
    return KeyList(
      map['id'] as int,
      map['key'] as String,
    );
  }
}